//
//  InformationViewController.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/3/27.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "InformationViewController.h"
#import "InformationTableViewCell.h"
#import "ExaminationViewController.h"
#import "REMenuItem.h"


@interface InformationViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *iconArray;
@property (nonatomic, strong) REMenu *menu;
@property (weak, nonatomic) IBOutlet UITableView *myTableview;
@property (nonatomic, assign) BOOL finish;
@property (nonatomic,strong) UIView *header;
@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.flag ? @"我的试卷" : @"做题记录" ;
    self.dataArray = @[@"2015年二级建造师学习导入课为什么学习二级建造师",@"2015年二级建造师学习导入课为什么学习二级建造师",@"2015年二级建造师学习导入课为什么学习二级建造师",@"2015年二级建造师学习导入课为什么学习二级建造师"];
    self.iconArray = @[@"course_live_icon_01",@"course_live_icon_02",@"course_live_icon_03",@"course_live_icon_04"];
   //
    NSArray *titles = @[@"类型",@"项目",@"班型",@"科目"];
    int header = 45;
    int footer = 50;
    NSArray *footers = @[@"未完成的答题",@"已完成的答题"];
    self.myTableview.tableHeaderView = [self buildHeader:titles andHeight:header withY:0];
    if (!self.flag) {
       [self.view addSubview:[self buildHeader:footers andHeight:footer withY:self.view.bounds.size.height-footer]];
         self.finish = NO;
    }
    [self loadMenu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"Information";
    InformationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil)
    {
        // Use the default cell style.
        cell = [[InformationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    // Set up the cell.
    [cell updateCellWithString:_dataArray[indexPath.row] flag:self.flag];
    if (self.flag) {
    }else {
        [cell.button setTitle: self.finish ? @"查看解析" : @"继续做题" forState:UIControlStateNormal];
        cell.button.backgroundColor = self.finish ? kGreenColor:kAppThemeColor;
        if (self.finish) {
            cell.button.imageView.image = [UIImage imageNamed:@""];
        }
    }
    [cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 74;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
#pragma mark - private method
- (void)loadMenu{
    __typeof (self) __weak weakSelf = self;
    REMenuItem *homeItem = [[REMenuItem alloc] initWithTitle:@"全部"
                                                    subtitle:@""
                                                       image:nil
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          NSLog(@"Item: %@", item);
                                                          item.textColor = kRedColor;
                                                      }];
    
    REMenuItem *exploreItem = [[REMenuItem alloc] initWithTitle:@"模拟试题"
                                                       subtitle:nil
                                                          image:nil
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             NSLog(@"Item: %@", item);
                                                            
                                                         }];
    
    REMenuItem *activityItem = [[REMenuItem alloc] initWithTitle:@"历年真题"
                                                        subtitle:nil
                                                           image: nil
                                                highlightedImage:nil
                                                          action:^(REMenuItem *item) {
                                                              NSLog(@"Item: %@", item);
                                                             
                                                          }];
    
    
    REMenuItem *profileItem = [[REMenuItem alloc] initWithTitle:@"章节练习"
                                                          image:nil
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             NSLog(@"Item: %@", item);
                                                             
                                                         }];
    REMenuItem *Item = [[REMenuItem alloc] initWithTitle:@"自测题"
                                                          image:nil
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             NSLog(@"Item: %@", item);
                                                             
                                                         }];


    self.menu = [[REMenu alloc] initWithItems:@[homeItem, exploreItem, activityItem, profileItem,Item]];
    self.menu.backgroundColor = [UIColor whiteColor];
    self.menu.highlightedBackgroundColor = [UIColor lightGrayColor];
    self.menu.highlightedSeparatorColor = [UIColor lightGrayColor];
    self.menu.borderColor = kLineColor;
    self.menu.borderWidth = 0.5;
    self.menu.separatorColor = kLineColor;
    self.menu.separatorHeight = 1;
    self.menu.itemHeight = 34;
    
    self.menu.separatorOffset = CGSizeMake(15.0, 0.0);
    self.menu.textOffset =  CGSizeMake(-90, 0);
    self.menu.waitUntilAnimationIsComplete = NO;
    self.menu.font = [UIFont systemFontOfSize:16.0];
    self.menu.textColor = [UIColor blackColor];
    self.menu.delegate = self;
    
    
    [self.menu setClosePreparationBlock:^{
        NSLog(@"Menu will close");
    }];
    
    [self.menu setCloseCompletionHandler:^{
            for (UIButton *btn in weakSelf.header.subviews) {
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [btn setImage:[UIImage imageNamed:@"arrow-down"] forState:UIControlStateNormal];
            }
        NSLog(@"Menu did close");
    }];

}
- (void)toggleMenu
{
    if (self.menu.isOpen){
        return [self.menu close];
    }
    [self.menu showFromRect:CGRectMake(0, 110, self.view.bounds.size.width , 300) inView:self.view];
}
- (void)buttonAction:(UIButton *)sender{
    NSIndexPath *indexpath = [self.myTableview indexPathForCell:(UITableViewCell *)([[sender superview] superview])];
    ExaminationViewController *vc = [[ExaminationViewController alloc] init];
    vc.customTitle = self.dataArray[indexpath.row];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
- (UIView *)buildHeader:(NSArray*)titles andHeight:(int)height withY:(float)y{
    
    int buttonFooterDefaultTag = 100;
    int buttonHeaderDefaultTag = 200;
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, y, self.view.bounds.size.width, height)];
    header.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i< titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*(self.view.bounds.size.width/titles.count),0 , self.view.bounds.size.width/titles.count, height);
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor whiteColor];
        [Tools configureView:button isCorner:NO];
        if (y>0) {
            if (i==0) {
                button.backgroundColor = kRedColor;
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }
            button.tag = buttonFooterDefaultTag+i;
        }else {
            button.titleEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
            button.imageEdgeInsets = UIEdgeInsetsMake(0, 50, 0, 0);
            [button setImage:[UIImage imageNamed:@"arrow-down"] forState:UIControlStateNormal];
             button.tag = buttonHeaderDefaultTag+i;
        }
        [button addTarget:self action:@selector(buttonAction1:) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:button];
    }
    if (y<=0) {
        self.header = header;
    }
    return header;
}
- (void)buttonAction1:(UIButton *)sender{
    [sender setTitleColor:kRedColor forState:UIControlStateNormal];
    [sender setImage:[UIImage imageNamed:@"arrow-up"] forState:UIControlStateNormal];
    NSInteger tag = sender.tag;
    if (tag > 101) {//类型、项目等选择
        [self toggleMenu];
    }else if(tag==100){//未完成答题
        [self layoutButtonWith:101 andButton:sender];
        self.finish = NO;
        [self.myTableview reloadData];

    }else if(tag==101){//已完成答题
        [self layoutButtonWith:100 andButton:sender];
        self.finish = YES;
        [self.myTableview reloadData];
    }
    
}
- (void)layoutButtonWith:(NSInteger)tag andButton:(UIButton *)sender{
    sender.backgroundColor = kRedColor;
    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIButton *temp = (UIButton *)[sender.superview viewWithTag:tag];
    temp.backgroundColor = [UIColor whiteColor];
    [temp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}
@end
