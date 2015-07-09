//
//  RegisterViewController.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/6/27.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UITextField *validPassWord;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.userName setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.passWord setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.validPassWord setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *normal = [UIImage imageNamed:@"navigation_back_icon"];
    [button setImage:normal forState:UIControlStateNormal];
    button.frame = CGRectMake(15, 15,44, 44);
    [button addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - private method 
- (void)backAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)registerAction:(id)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
}


@end
