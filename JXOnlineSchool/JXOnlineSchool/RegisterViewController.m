//
//  RegisterViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/21.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *yanzhengma;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.loginButton.backgroundColor = [UIColor clearColor];
    self.loginButton.layer.borderWidth = 0.5;
    self.loginButton.layer.masksToBounds = YES;
    self.loginButton.layer.cornerRadius = 5;
    
    self.yanzhengma.layer.borderColor = [UIColor whiteColor].CGColor;
    self.yanzhengma.backgroundColor = [UIColor clearColor];
    self.yanzhengma.layer.borderWidth = 0.5;
    self.yanzhengma.layer.masksToBounds = YES;
    self.yanzhengma.layer.cornerRadius = 5;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//MARK:- Delegate or DataSource

//MARK:- NSNotification Method

//MARK:- Action Method
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

//MARK:- Private Method



@end
