//
//  LatestViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/11.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "LatestViewController.h"
#import "CourseTableViewCell.h"
#import "SearchController.h"

@interface LatestViewController ()

@property (weak, nonatomic) IBOutlet UITableView *customTableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation LatestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    searchBtn.frame = CGRectMake(0, 0 ,40, 40);
//    searchBtn.backgroundColor = [UIColor orangeColor];
//    [searchBtn addTarget:self action:@selector(searchButtonAction) forControlEvents:UIControlEventTouchUpInside];
//    [searchBtn setImage: [UIImage imageNamed: @"common"] forState: UIControlStateNormal];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    self.dataArray = @[@"2015年山东二级建造师报名入口",@"2015年甘肃二级建造师报名入口",@"2015年云南二级建造师考试资格审查报名入口",@"2015年北京二级建造师报名入口"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UINavigationController *nav  = (UINavigationController *)[[[UIApplication sharedApplication]keyWindow] rootViewController];
    [nav setNavigationBarHidden:NO animated:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    UINavigationController *nav  = (UINavigationController *)[[[UIApplication sharedApplication]keyWindow] rootViewController];
    [nav setNavigationBarHidden:YES animated:animated];
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"Information";
    CourseTableViewCell *cell = (CourseTableViewCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil)
    {
        // Use the default cell style.
        cell = (CourseTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"CourseTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    CourseDetailViewController *latestVC = [CourseDetailViewController CreateFromMainStoryboard];
//    UINavigationController *nav = (UINavigationController *)[[UIApplication sharedApplication] keyWindow].rootViewController;
//    [nav pushViewController:latestVC animated:YES];
//    
}

#pragma mark - Action Method

#pragma mark - Private Method


@end
