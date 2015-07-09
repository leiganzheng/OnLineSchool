//
//  CourseDetailViewController.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/3/27.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "CourseDetailViewController.h"
#import "CourseTableViewCell.h"
#import "CoureseTwoTableViewCell.h"

@interface CourseDetailViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UITableView *customTableview;
@end

@implementation CourseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"2015年二级建造师学习导入课——为什么学习二级建造师",@"2015年二级建造师学习导入课——为什么学习二级建造师",@"二级建造师《法规及相关知识》真题集（2011-2014）",@"2015年二级建造师学习导入课——为什么学习二级建造师",@"2015年二级建造师学习导入课——为什么学习二级建造师",@"2015年二级建造师学习导入课——为什么学习二级建造师"];
       CGFloat with = self.dataArray.count*75>kScreenHeight ? kScreenHeight:(self.dataArray.count+1)*75;
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
    if (indexPath.row == 2) {
        static NSString *MyIdentifier = @"CourseCellIdentifierTwo";
        CoureseTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if (cell == nil)
        {
            // Use the default cell style.
            cell = [[CoureseTwoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        }
        // Set up the cell.
        cell.contentLB.text = _dataArray[indexPath.row];
        return cell;
    }else{
        static NSString *MyIdentifier = @"CourseCellIdentifier";
        CourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if (cell == nil)
        {
            // Use the default cell style.
            cell = [[CourseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        }
        // Set up the cell.
        cell.contentLB.text = _dataArray[indexPath.row];
        return cell;
    }

}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


#pragma mark - private method


@end
