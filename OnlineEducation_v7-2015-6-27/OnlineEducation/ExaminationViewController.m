//
//  ExaminationViewController.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/7/11.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "ExaminationViewController.h"
#import "SheetViewController.h"
@interface ExaminationViewController ()

@end

@implementation ExaminationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"试卷名称";
    [self.list addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.answers addTarget:self action:@selector(anButtonAction) forControlEvents:UIControlEventTouchUpInside];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark:- private method

- (void)buttonAction{
    [self.navigationController pushViewController:[[SheetViewController alloc]init] animated:YES];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[SheetViewController alloc]init]];
//    [self presentViewController:nav animated:YES completion:^{
//        
//    }];
}
- (void)anButtonAction{

}
@end
