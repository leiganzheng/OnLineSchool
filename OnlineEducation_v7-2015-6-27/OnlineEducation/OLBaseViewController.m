//
//  OLBaseViewController.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/3/27.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "OLBaseViewController.h"
#import "UIViewController+Appearence.h"

@interface OLBaseViewController ()

@end

@implementation OLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [self createBackButton];
    self.view.backgroundColor = kBgColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
