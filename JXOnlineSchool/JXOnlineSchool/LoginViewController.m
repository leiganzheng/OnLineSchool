//
//  LoginViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/15.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "LoginViewController.h"
#import "Define.h"
#import "RegisterViewController.h"
#import "UIResponder+StoryBoard.h"

@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UIView *logiView;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UIButton *oneKeyLoginButton;
@property (weak, nonatomic) IBOutlet UIButton *closeOnekeyLoginButton;

@property (weak, nonatomic) IBOutlet UIButton *qqBtn;
@property (weak, nonatomic) IBOutlet UIButton *weixinBtn;
@property (weak, nonatomic) IBOutlet UIButton *sinaBtn;
@property (weak, nonatomic) IBOutlet UIButton *tengxunBtn;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"loginView" owner:self options:nil];
    self.logiView = views[0];
    self.logiView.frame = CGRectMake(0,  kScreenHeight + self.logiView.frame.size.width, self.logiView.frame.size.width, self.logiView.frame.size.height);
    [self.view addSubview:self.logiView];
    
    self.loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.loginButton.backgroundColor = [UIColor clearColor];
    self.loginButton.layer.borderWidth = 0.5;
    self.loginButton.layer.masksToBounds = YES;
    self.loginButton.layer.cornerRadius = 5;
    

    [self.qqBtn setImageEdgeInsets: UIEdgeInsetsMake(-8, 20, 0, 0)];
    [self.qqBtn setTitleEdgeInsets: UIEdgeInsetsMake(0, -60, -70, 0)];
    [self.weixinBtn setImageEdgeInsets: UIEdgeInsetsMake(-8, 20, 0, 0)];
    [self.weixinBtn setTitleEdgeInsets: UIEdgeInsetsMake(0, -60, -70, 0)];
    [self.sinaBtn setImageEdgeInsets: UIEdgeInsetsMake(-8, 20, 0, 0)];
    [self.sinaBtn setTitleEdgeInsets: UIEdgeInsetsMake(0, -60, -70, 0)];
    [self.tengxunBtn setImageEdgeInsets: UIEdgeInsetsMake(-8, 20, 0, 0)];
    [self.tengxunBtn setTitleEdgeInsets: UIEdgeInsetsMake(0, -60, -70, 0)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//MARK:- Delegate or DataSource

//MARK:- NSNotification Method

//MARK:- Action Method
- (IBAction)oneKeyButtonAction:(id)sender {
   [UIView animateWithDuration:0.5 animations:^{
       self.logiView.frame = CGRectMake(0,  kScreenHeight - self.logiView.frame.size.height , self.logiView.frame.size.width, self.logiView.frame.size.height);
   } completion:^(BOOL finished) {
       
   }];
}
- (IBAction)loginButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)forgetPassWord:(id)sender {
}
- (IBAction)RegisterAction:(id)sender {
    RegisterViewController *latestVC = [RegisterViewController CreateFromMainStoryboard];
    [self presentViewController:latestVC animated:YES completion:^{
        
    }];
//    UINavigationController *nav = (UINavigationController *)[[UIApplication sharedApplication] keyWindow].rootViewController;
//    [nav pushViewController:latestVC animated:YES];

}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)closeOnekeyLoginButtonAction:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
       self.logiView.frame = CGRectMake(0,  kScreenHeight + self.logiView.frame.size.width, self.logiView.frame.size.width, self.logiView.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
}


//MARK:- Private Method


@end
