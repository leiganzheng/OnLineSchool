//
//  InformationMainViewController.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/3/27.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "InformationMainViewController.h"
#import "InformationViewController.h"
#import "MistakeViewController.h"
@interface InformationMainViewController ()

@end

@implementation InformationMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       self.navigationItem.leftBarButtonItem = nil;
    for (UIView *v in self.view.subviews) {
        if ([v isKindOfClass:[UIView class]]) {
            v.layer.cornerRadius = 10.0;
            v.layer.masksToBounds = YES;
            
        }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - prepareForSegue method
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *des = segue.destinationViewController;
    if ([des isKindOfClass:[MistakeViewController class]]||[segue.identifier isEqualToString:@"DoneProblem"]) {
         des.hidesBottomBarWhenPushed = YES;
    }else{
        if ([segue.identifier isEqualToString:@"DoneProblem"]) {
            InformationViewController *temp = (InformationViewController*)des;
            temp.flag = NO;
        }else{
            InformationViewController *temp = (InformationViewController*)des;
            temp.flag = YES;
        }
    }
   
}

@end
