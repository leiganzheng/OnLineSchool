//
//  MistakeViewController.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/7/9.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "MistakeViewController.h"
#import "MistakeTableViewCell.h"
#import "ExaminationViewController.h"
#import "REMenuItem.h"

typedef NS_ENUM(NSInteger, finishType) {
    kDefaultType = 0,//全部
    KUnFinishType = 1,//未解决
    kFinishType = 2//已解决
};
@interface MistakeViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myTableview;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *iconArray;
@property(nonatomic,assign) finishType finish;
@property (nonatomic, strong) REMenu *menu;
@property (nonatomic,strong) UIView *header;
@end

@implementation MistakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.dataArray = @[@"2015年山东二级建造师报名入口",@"2015年甘肃二级建造师报名入口",@"2015年云南二级建造师考试资格审查报名入口",@"2015年北京二级建造师报名入口"];
        self.iconArray = @[@"course_live_icon_01",@"course_live_icon_02",@"course_live_icon_03",@"course_live_icon_04"];
        NSArray *titles = @[@"类型",@"项目",@"题型"];
        int header = 45;
        int footer = 50;
        NSArray *footers = @[@"全部错题",@"未解决错题",@"已解决错题"];
       self.myTableview.tableHeaderView = [self buildHeader:titles andHeight:header withY:0];
      [self.view addSubview:[self buildHeader:footers andHeight:footer withY:self.view.bounds.size.height-footer]];
    self.finish = kDefaultType;
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
        static NSString *MyIdentifier = @"Mistake";
        MistakeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if (cell == nil)
        {
            // Use the default cell style.
            cell = [[MistakeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        }
        // Set up the cell.
        [cell updateCellWithString:_dataArray[indexPath.row]];
    [cell.button1 addTarget:self action:@selector(button1Action) forControlEvents:UIControlEventTouchUpInside];
    [cell.button2 addTarget:self action:@selector(button2Action) forControlEvents:UIControlEventTouchUpInside];
        return cell;
}
    
    
#pragma mark - UITableViewDelegate
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        return 89;
}
    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        //    [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
}

#pragma mark - private method
- (void)button1Action{
    UIViewController *vc = [[ExaminationViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)button2Action{
    UIViewController *vc = [[ExaminationViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
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

- (UIView *)buildHeader:(NSArray*)titles andHeight:(int)height withY:(float)y{
    int buttonFooterDefaultTag = 100;
    int buttonHeaderDefaultTag = 200;
        UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, y, self.view.bounds.size.width, height)];
        header.backgroundColor = [UIColor whiteColor];
        [Tools configureView:header isCorner:NO];
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
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [header addSubview:button];
        }
    if (y<=0) {
        self.header = header;
    }
        return header;
}
- (void)buttonAction:(UIButton *)sender{
    [sender setTitleColor:kRedColor forState:UIControlStateNormal];
    [sender setImage:[UIImage imageNamed:@"arrow-up"] forState:UIControlStateNormal];
    NSInteger tag = sender.tag;
    if (tag > 102) {//类型、项目等选择
        [self toggleMenu];
    }else if(tag==100){//全部
        [self layoutButtonWith:101 andButton:sender];
        [self layoutButtonWith:102 andButton:sender];
        self.finish = kDefaultType;
        [self.myTableview reloadData];
        
    }else if(tag==101){//未解决
        [self layoutButtonWith:100 andButton:sender];
        [self layoutButtonWith:102 andButton:sender];
        self.finish = KUnFinishType;
        [self.myTableview reloadData];
    }else if(tag==102){//已经解决
        [self layoutButtonWith:100 andButton:sender];
        [self layoutButtonWith:101 andButton:sender];
        self.finish = kFinishType;
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
