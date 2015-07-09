//
//  SettingViewController.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/3/27.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "SettingViewController.h"
#import "LoginViewController.h"

#define kCellHeight 44

@interface SettingViewController ()
@property (nonatomic, strong) NSArray *settingWords;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    self.settingWords = @[@[@"存储目录设置",@"手机存储总空间9.1GB/剩余8.9GB",@"手机存储总空间9.1GB/剩余8.9GB"], @[@"常用设置",@"WiFi选择 允许非WiFi网络离线",@"清除缓存",@"检查更新"],@[@"退出登录"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _settingWords.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_settingWords[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];     if (cell == nil)
    {
        // Use the default cell style.
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        cell.textLabel.textColor = kCyColorFromRGB(121, 121, 121);
    }
    // Set up the cell.
    if (indexPath.section == 1 && indexPath.row == 1) {
        UISwitch *notificationSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(265, 0, 20, 10)];
        notificationSwitch.on = YES;
        notificationSwitch.center = CGPointMake(notificationSwitch.center.x, kCellHeight/2);
        [notificationSwitch addTarget:self action:@selector(swichAction:) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView = notificationSwitch;
    }else if (indexPath.section == 2){
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, cell.contentView.frame.size.height)];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = kCyColorFromRGB(121, 121, 121);
//        label.center = CGPointMake(cell.center.x, kCellHeight/2);
        label.text = @"退出登录";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:15];
        [cell.contentView addSubview:label];
        return cell;
    }
        cell.textLabel.text = _settingWords[indexPath.section][indexPath.row];
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 2) {
        [self logout];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
   
}

#pragma mark - private method

- (void)logout{
    UIStoryboard * storyboard = [ UIStoryboard storyboardWithName:@"Main" bundle:nil ];
    LoginViewController *loginVC = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewID" ];
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 1;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = kCATransitionFade;
    animation.subtype = kCATransitionFromRight;
    [[UIApplication sharedApplication] keyWindow].rootViewController = loginVC;
    [[[UIApplication sharedApplication] keyWindow].layer addAnimation:animation forKey:@"animation"];
}

- (void)swichAction:(UISwitch *)sender{
    if (sender.on) {
       
    }else{

    }
}


@end
