//
//  MyCourseViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/12.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "MyCourseViewController.h"
#import "MyCourseTableViewCell.h"
#import "VideoPlayerViewController.h"
#import "DownLoadViewController.h"
#import "UIResponder+StoryBoard.h"

@interface MyCourseViewController ()
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation MyCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(0, 0 ,40, 40);
    searchBtn.backgroundColor = [UIColor orangeColor];
    [searchBtn addTarget:self action:@selector(searchButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [searchBtn setImage: [UIImage imageNamed: @"common"] forState: UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
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
    return 4;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
        return 80;
}
- (UIView *)tableView:(UITableView *)tableView

viewForHeaderInSection:(NSInteger)section

{
    UIView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"MyCourseSection" owner:self options:nil] objectAtIndex:0];
    return headerView;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"myCourseCell";
    MyCourseTableViewCell *cell = (MyCourseTableViewCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil)
    {
        // Use the default cell style.
        cell = [[MyCourseTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
    }
    [cell.playButton addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    [cell.downLoadButton addTarget:self action:@selector(downLoad) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - Action Method
- (void)searchButtonAction{
    
}
#pragma mark - Private Method
- (void)play{
    VideoPlayerViewController *latestVC = [VideoPlayerViewController CreateFromMainStoryboard];
    UINavigationController *nav = (UINavigationController *)[[UIApplication sharedApplication] keyWindow].rootViewController;
    [nav pushViewController:latestVC animated:YES];
}
- (void)downLoad{
    DownLoadViewController *latestVC = [DownLoadViewController CreateFromMainStoryboard];
    UINavigationController *nav = (UINavigationController *)[[UIApplication sharedApplication] keyWindow].rootViewController;
    [nav pushViewController:latestVC animated:YES];
}


@end
