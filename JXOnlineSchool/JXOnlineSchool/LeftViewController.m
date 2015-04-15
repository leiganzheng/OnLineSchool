//
//  LeftViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/10.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "LeftViewController.h"
#import "Define.h"
#import "UIResponder+StoryBoard.h"
#import "DownLoadViewController.h"
#import "SettingViewController.h"
#import "CustomerServiceViewController.h"
#import "MyCollectionViewController.h"
#import "MyCourseViewController.h"
#import "RecommendViewController.h"
#import "ChangeNicknameViewController.h"
#import "LoginViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor clearColor];
    [self initSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -

#pragma mark - Action Method
- (void)userLogoButtonAction{
   [self presentViewController:[LoginViewController CreateFromMainStoryboard] animated:YES completion:^{
       
   }];
}
- (void)nickButtonAction{
    UINavigationController *nav = (UINavigationController *)[[UIApplication sharedApplication] keyWindow].rootViewController;
    [nav pushViewController:[ChangeNicknameViewController CreateFromMainStoryboard] animated:YES];
}

- (void)buttonAction:(UIButton *)sender{
    JXBaseViewController *VC;
    switch (sender.tag) {
        case 1000:
        {
            VC = (RecommendViewController *)[RecommendViewController CreateFromMainStoryboard];

        }
            break;
        case 1001:
        {
            VC = (DownLoadViewController *)[DownLoadViewController CreateFromMainStoryboard];

        }
            break;
        case 1002:
        {
            VC = (MyCourseViewController *)[MyCourseViewController CreateFromMainStoryboard];

        }
            break;
        case 1003:
        {
            VC = (MyCollectionViewController *)[MyCollectionViewController CreateFromMainStoryboard];
            
        }
            break;

        case 1004:
        {
            VC = (JXBaseViewController *)[SettingViewController CreateFromMainStoryboard];
            
        }
            break;

        case 1005:
        {
            VC = (CustomerServiceViewController *)[CustomerServiceViewController CreateFromMainStoryboard];
            
        }
            break;

        default:
            break;
    }
    UINavigationController *nav = (UINavigationController *)[[UIApplication sharedApplication] keyWindow].rootViewController;
    [nav pushViewController:VC animated:YES];
}
#pragma mark - Private Method
- (void)initSubviews{
    
    UIImageView *imageBgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth,kScreenHeight)];
    [self.view addSubview:imageBgV];
    
    UIButton *userLogo = [[UIButton alloc] initWithFrame:CGRectMake(70, 56, 80, 80)];
    userLogo.backgroundColor = [UIColor orangeColor];
    userLogo.layer.cornerRadius = userLogo.frame.size.width/2;
    userLogo.layer.masksToBounds = YES;
    [userLogo addTarget:self action:@selector(userLogoButtonAction) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:userLogo];
    
    UILabel *userName= [[UILabel alloc] initWithFrame:CGRectMake(50, 140, 120, 30)];
    userName.text = @"努力的猫咪";
    userName.textColor = [UIColor whiteColor];
    userName.backgroundColor = [UIColor clearColor];
    userName.font = [UIFont boldSystemFontOfSize:18.0f];
    userName.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:userName];
    
    UIButton *nickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nickBtn.frame = CGRectMake(userName.frame.origin.x + userName.frame.size.width-10, userName.frame.origin.y-6, 40, 40);
    nickBtn.backgroundColor = [UIColor lightGrayColor];
    [nickBtn setImage: [UIImage imageNamed: @"common"] forState: UIControlStateNormal];
    [nickBtn addTarget:self action:@selector(nickButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nickBtn];

    
    
    CGFloat y = 210;
    CGFloat x = 20;
    CGFloat with = 90;
    CGFloat height = 90;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(x, y, with, height);
    button.backgroundColor = [UIColor lightGrayColor];
    button.tag = 1000;
    [button setTitle:@"浏览记录" forState:UIControlStateNormal];
    [button setImage: [UIImage imageNamed: @"common"] forState: UIControlStateNormal];
        [button setImageEdgeInsets: UIEdgeInsetsMake(-8, 20, 0, 0)];
        [button setTitleEdgeInsets: UIEdgeInsetsMake(0, -15, -60, 0)];

    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(x + with + 10, y, with, height);
    button1.backgroundColor = [UIColor redColor];
    button1.tag = 1001;
    [button1 setTitle:@"离线下载" forState:UIControlStateNormal];
    [button1 setImage: [UIImage imageNamed: @"common"] forState: UIControlStateNormal];
    [button1 setImageEdgeInsets: UIEdgeInsetsMake(-8, 20, 0, 0)];
    [button1 setTitleEdgeInsets: UIEdgeInsetsMake(0, -15, -60, 0)];

    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    

    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(x, y+button.frame.size.width+10, with, height);
    button2.backgroundColor = [UIColor blueColor];
    button2.tag = 1002;
    [button2 setImage: [UIImage imageNamed: @"common"] forState: UIControlStateNormal];
    [button2 setImageEdgeInsets: UIEdgeInsetsMake(-8, 20, 0, 0)];
    [button2 setTitleEdgeInsets: UIEdgeInsetsMake(0, -15, -60, 0)];

    [button2 setTitle:@"我的课程" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(x + with +10,  y+button.frame.size.width+10, with, height);
    button3.backgroundColor = [UIColor orangeColor];
    button3.tag = 1003;
    [button3 setImage: [UIImage imageNamed: @"common"] forState: UIControlStateNormal];
    [button3 setImageEdgeInsets: UIEdgeInsetsMake(-8, 20, 0, 0)];
    [button3 setTitleEdgeInsets: UIEdgeInsetsMake(0, -15, -60, 0)];

    [button3 setTitle:@"我的收藏" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectMake(x, y+button.frame.size.width*2+20, with, height);
    button4.backgroundColor = [UIColor redColor];
    button4.tag = 1004;
    [button4 setImage: [UIImage imageNamed: @"common"] forState: UIControlStateNormal];
    [button4 setImageEdgeInsets: UIEdgeInsetsMake(-8, 20, 0, 0)];
    [button4 setTitleEdgeInsets: UIEdgeInsetsMake(0, -15, -60, 0)];

    [button4 setTitle:@"更多设置" forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.frame = CGRectMake(x+with+10, y+button.frame.size.width*2+20, with, height);
    button5.backgroundColor = [UIColor blueColor];
    button5.tag = 1005;
    [button5 setImage: [UIImage imageNamed: @"common"] forState: UIControlStateNormal];
    [button5 setImageEdgeInsets: UIEdgeInsetsMake(-8, 20, 0, 0)];
    [button5 setTitleEdgeInsets: UIEdgeInsetsMake(0, -15, -60, 0)];

    [button5 setTitle:@"客服电话" forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];

    


}


@end
