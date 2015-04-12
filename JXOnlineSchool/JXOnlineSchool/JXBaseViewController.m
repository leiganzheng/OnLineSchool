//
//  JXBaseViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/10.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "JXBaseViewController.h"
#import "UIViewController+Appearence.h"
#import "UIResponder+StoryBoard.h"
#import "Define.h"

@interface JXBaseViewController ()

@end

@implementation JXBaseViewController

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
