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
#import "ResultViewController.h"

@interface InformationViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *iconArray;
@property (weak, nonatomic) IBOutlet UITableView *myTableview;
@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.flag ? @"我的试卷" : @"做题记录" ;
    self.dataArray = @[@"2015年山东二级建造师报名入口",@"2015年甘肃二级建造师报名入口",@"2015年云南二级建造师考试资格审查报名入口",@"2015年北京二级建造师报名入口"];
    self.iconArray = @[@"course_live_icon_01",@"course_live_icon_02",@"course_live_icon_03",@"course_live_icon_04"];
   //
    NSArray *titles = @[@"类型",@"项目",@"班型",@"科目"];
    int header = 45;
    int footer = 50;
    NSArray *footers = @[@"未完成答题",@"已完成答题"];
    self.myTableview.tableHeaderView = [self buildHeader:titles andHeight:header withY:0];
    [self.view addSubview:[self buildHeader:footers andHeight:footer withY:self.view.bounds.size.height-footer]];
    

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
    [cell.button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
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
- (void)buttonAction{
//    UIStoryboard * storyboard = [ UIStoryboard storyboardWithName:@"Main" bundle:nil ];
//    ResultViewController *loginVC = [storyboard instantiateViewControllerWithIdentifier:@"ResultViewID" ];
    UIViewController *vc = [[ExaminationViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
- (UIView *)buildHeader:(NSArray*)titles andHeight:(int)height withY:(float)y{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, y, self.view.bounds.size.width, height)];
    header.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i< titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*(self.view.bounds.size.width/titles.count),0 , self.view.bounds.size.width/titles.count, height);
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor whiteColor];
        button.layer.borderWidth = 0.5;
        button.layer.borderColor = [kCyColorFromRGB(211, 211, 211) CGColor];
        [header addSubview:button];
    }
    return header;
}
@end
