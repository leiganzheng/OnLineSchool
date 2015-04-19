//
//  SettingViewController.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/3/27.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "SettingViewController.h"
#import "Define.h"
#import "ChangeNicknameViewController.h"
#import "ChangPasswordViewController.h"
#import "UIResponder+StoryBoard.h"
#import "AboutViewController.h"

#define kCellHeight 44

@interface SettingViewController ()
@property (nonatomic, strong) NSArray *settingWords;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更多设置";
    self.settingWords = @[@[@"头像",@"修改昵称",@"更改密码"], @[@"允许2G/3G下缓存视频",@"连续播放",@"关于建迅",@"当前版本",@"意见反馈"],@[@"退出登录"]];
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
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    // Set up the cell.
    if ((indexPath.section == 1 && indexPath.row == 0)||(indexPath.section == 1 && indexPath.row == 1)) {
        UISwitch *notificationSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(265, 0, 20, 10)];
        notificationSwitch.on = YES;
        notificationSwitch.center = CGPointMake(notificationSwitch.center.x, kCellHeight/2);
        [notificationSwitch addTarget:self action:@selector(swichAction:) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView = notificationSwitch;
        
        UISwitch *notificationSwitch1 = [[UISwitch alloc] initWithFrame:CGRectMake(265, 0, 20, 10)];
        notificationSwitch1.on = YES;
        notificationSwitch1.center = CGPointMake(notificationSwitch.center.x, kCellHeight/2);
        [notificationSwitch1 addTarget:self action:@selector(swichAction:) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView = notificationSwitch1;
        cell.accessoryType = UITableViewCellAccessoryNone;

    }else if (indexPath.section == 0 && indexPath.row == 0){
        UIImageView *userLogo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        userLogo.backgroundColor = [UIColor orangeColor];
        userLogo.layer.cornerRadius = userLogo.frame.size.width/2;
        userLogo.layer.masksToBounds = YES;
        cell.accessoryView = userLogo;
    }else if(indexPath.section == 1 && indexPath.row == 3){
        cell.accessoryType = UITableViewCellAccessoryNone;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = kCyColorFromRGB(0, 0 , 0);
        label.text = [NSString stringWithFormat:@"V%@",APP_VERSION];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:15];
        cell.accessoryView = label;
    }
    else if (indexPath.section == 2){
        cell.accessoryType = UITableViewCellAccessoryNone;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, cell.contentView.frame.size.height)];
        label.backgroundColor = [UIColor redColor];
        label.textColor = kCyColorFromRGB(255, 255, 255);
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
    JXBaseViewController *VC;
    if (indexPath.section == 0 && indexPath.row == 1) {
        VC = (ChangeNicknameViewController *)[ChangeNicknameViewController CreateFromMainStoryboard];

    }
    else if (indexPath.section == 0 && indexPath.row == 2) {
        VC = (ChangPasswordViewController *)[ChangPasswordViewController CreateFromMainStoryboard];
    }else if (indexPath.section == 0 && indexPath.row == 0){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancelAction];
        [alertController addAction:deleteAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }else if (indexPath.section == 1 && indexPath.row == 2){
        VC = (AboutViewController *)[AboutViewController CreateFromMainStoryboard];
    }
    if (indexPath.section == 2) {
        [self logout];
    }
    UINavigationController *nav = (UINavigationController *)[[UIApplication sharedApplication] keyWindow].rootViewController;
    [nav pushViewController:VC animated:YES];

}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
   
}

#pragma mark - private method

- (void)logout{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"您将退出此次登陆，是否确定" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)swichAction:(UISwitch *)sender{
    if (sender.on) {
       
    }else{

    }
}


@end
