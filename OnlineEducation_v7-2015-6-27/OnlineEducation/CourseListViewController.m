//
//  CourseListViewController.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/3/27.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "CourseListViewController.h"
#import "CourseDetailTableViewCell.h"

@interface CourseListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *customTableview;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *iconArray;
@end

@implementation CourseListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"建设工程法规及相关知识",@"建设工程施工管理",@"建设工程管理与实务"];
    self.iconArray = @[@"course_list_icon_01",@"course_list_icon_02",@"course_list_icon_03"];
    CGFloat with = self.dataArray.count*75>kScreenHeight ? kScreenHeight:self.dataArray.count*75+10;
    self.customTableview.frame = CGRectMake(self.customTableview.frame.origin.x, self.customTableview.frame.origin.y, self.customTableview.frame.size.width, with);
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
    static NSString *MyIdentifier = @"CourseDetailIdentifier";
    CourseDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil)
    {
        // Use the default cell style.
        cell = [[CourseDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    // Set up the cell.
    cell.customImageView.image = [UIImage imageNamed:_iconArray[indexPath.row]];
    cell.contentLB.text = _dataArray[indexPath.row];
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


#pragma mark - private method

@end
