//
//  MainViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/10.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "MainViewController.h"
#import "Define.h"
#import "LatestViewController.h"
#import "CourseViewController.h"
#import "CourseDetailViewController.h"
#import "SliderViewController.h"
#import "UIResponder+StoryBoard.h"
#import "STAlertView.h"
#import "CourseTableViewCell.h"
#import "SearchController.h"

@interface MainViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) STAlertView *stAlertView;
@property (nonatomic,strong)   SearchController *searchController;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArray = @[@"2015年山东二级建造师报名入口",@"2015年甘肃二级建造师报名入口",@"2015年云南二级建造师考试资格审查报名入口",@"2015年北京二级建造师报名入口"];
    [self initSubviews];
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
    CourseTableViewCell *cell = (CourseTableViewCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil)
    {
        // Use the default cell style.
        cell = (CourseTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"CourseTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    // Set up the cell.
//    cell.textLabel.text= self.dataArray[indexPath.row];
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CourseDetailViewController *latestVC = [CourseDetailViewController CreateFromMainStoryboard];
    UINavigationController *nav = (UINavigationController *)[[UIApplication sharedApplication] keyWindow].rootViewController;
    [nav pushViewController:latestVC animated:YES];

}

#pragma mark - Action Method
- (void)lastestButtonAction{
    
    LatestViewController *latestVC = [LatestViewController CreateFromMainStoryboard];
    UINavigationController *nav = (UINavigationController *)[[UIApplication sharedApplication] keyWindow].rootViewController;
    [nav pushViewController:latestVC animated:YES];
    
}

- (void)courseButtonAction{
    CourseViewController *latestVC = [CourseViewController CreateFromMainStoryboard];
    UINavigationController *nav = (UINavigationController *)[[UIApplication sharedApplication] keyWindow].rootViewController;
    [nav pushViewController:latestVC animated:YES];
    
}

- (void)searchButtonAction{
//        self.stAlertView = [[STAlertView alloc] initWithTitle:@"Alert view with a textfield"
//                                                      message:@"I'm a native UIAlertView with a textfiled."
//                                                textFieldHint:@"What do you think about me?"
//                                               textFieldValue:nil
//                                            cancelButtonTitle:@"Cancel"
//                                            otherButtonTitles:@"Store"
//                            
//                                            cancelButtonBlock:^{
//                                                NSLog(@"Please, give me some feedback!");
//                                            } otherButtonBlock:^(NSString * result){
//                                                NSLog(@" You have said %@, but I can't store it :( . If you want, you can send it to me at hello@nestor.cat or via twitter @NestorMalet!", result);
//                                            }];
    _searchController = [[SearchController alloc] initWithContentsController:self searchBarFrame:CGRectMake(0, 20, self.view.bounds.size.width, 44) selected:^(id data) {
        
    } cancel:nil];
    [_searchController becomeFirstResponder];

}

- (void)userLogoButtonAction{
    [[SliderViewController sharedSliderController]showLeftViewController];
}

#pragma mark - Private Method
- (void)initSubviews{
    
    CGFloat heigt = 24;
    
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 242)];
    headerV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerV];
    
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 66, headerV.frame.size.width, headerV.frame.size.height-106)];
    bg.backgroundColor = [UIColor clearColor];
    bg.image = [UIImage imageNamed:@"index_banner"];
    [headerV addSubview:bg];
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 66)];
    v.backgroundColor = kCyColorFromRGB(35, 181, 236);
    [headerV addSubview:v];
    
    UILabel *userName= [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/2-40, heigt, 80, 40)];
    userName.text = @"建迅网校";
    userName.textAlignment = NSTextAlignmentCenter;
    userName.font = [UIFont systemFontOfSize:20];
    userName.textColor =  kCyColorFromRGB(255, 253, 254);
    userName.backgroundColor = [UIColor clearColor];
    [v addSubview:userName];
    
    UIButton *userLogo = [UIButton buttonWithType:UIButtonTypeCustom];
    userLogo.frame = CGRectMake(0, heigt, 40, 40);
    userLogo.backgroundColor = [UIColor clearColor];
    userLogo.layer.cornerRadius = userLogo.frame.size.width/2;
    userLogo.layer.masksToBounds = YES;
    [userLogo setImage: [UIImage imageNamed: @"index_avatar"] forState: UIControlStateNormal];

    [userLogo addTarget:self action:@selector(userLogoButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [v addSubview:userLogo];
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(kScreenWidth-42, heigt, 40, 40);
    searchBtn.backgroundColor = [UIColor clearColor];
    [searchBtn setImage: [UIImage imageNamed: @"icons_search"] forState: UIControlStateNormal];
    
    [searchBtn addTarget:self action:@selector(searchButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [v addSubview:searchBtn];
    
    
    UIButton *lastestBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    lastestBtn.frame = CGRectMake(0, headerV.frame.size.height-40, kScreenWidth/2-2, 40);
    lastestBtn.backgroundColor = kCyColorFromRGB(128, 205, 234);
    [lastestBtn setTitle:@"最新课程" forState:UIControlStateNormal];
    [lastestBtn addTarget:self action:@selector(lastestButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [lastestBtn setImage: [UIImage imageNamed: @"icons_index_news"] forState: UIControlStateNormal];
    [lastestBtn setImageEdgeInsets: UIEdgeInsetsMake(0, -8, 0, 0)];
    [headerV addSubview:lastestBtn];
    
    
    UIButton *courseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    courseBtn.frame = CGRectMake(kScreenWidth/2+2, headerV.frame.size.height-40, kScreenWidth/2-2, 40);
    courseBtn.backgroundColor = kCyColorFromRGB(128, 205, 234);
    [courseBtn setTitle:@"课程分类" forState:UIControlStateNormal];
    [courseBtn setImageEdgeInsets: UIEdgeInsetsMake(0, -8, 0, 0)];
    [courseBtn addTarget:self action:@selector(courseButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [courseBtn setImage: [UIImage imageNamed: @"icons_index_category"] forState: UIControlStateNormal];
    [headerV addSubview:courseBtn];
    
    UIImageView *index = [[UIImageView alloc] initWithFrame:CGRectMake(lastestBtn.frame.origin.x + lastestBtn.frame.size.width, lastestBtn.frame.origin.y, 4, 40)];
    index.backgroundColor = [UIColor clearColor];
    index.image = [UIImage imageNamed:@"icons_index_line"];
    [headerV addSubview:index];
    
    
    UITableView *customTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, headerV.frame.size.height, kScreenWidth, kScreenHeight-headerV.frame.size.height)];
    customTableView.backgroundColor = [UIColor clearColor];
    customTableView.delegate = self;
    customTableView.dataSource = self;
    [self.view addSubview:customTableView];
}

@end
