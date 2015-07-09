//
//  LoginViewController.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/3/27.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"
#import "RegisterViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passWordTF;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginButton.layer.cornerRadius = 3.0;
    self.loginButton.layer.masksToBounds = YES;
    [self.userNameTF setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
     [self.passWordTF setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - private method
- (IBAction)loginButtonAction:(id)sender {
    UIStoryboard * storyboard = [ UIStoryboard storyboardWithName:@"Main" bundle:nil ];
    HomeViewController *homeViewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewID"];
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 1;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = kCATransitionFade;
    animation.subtype = kCATransitionFromRight;
    [[UIApplication sharedApplication] keyWindow].rootViewController = homeViewController;
    [[[UIApplication sharedApplication] keyWindow].layer addAnimation:animation forKey:@"animation"];
}
- (IBAction)Register:(id)sender {
    UIStoryboard * storyboard = [ UIStoryboard storyboardWithName:@"Main" bundle:nil ];
    RegisterViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"RegisterViewID"];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
