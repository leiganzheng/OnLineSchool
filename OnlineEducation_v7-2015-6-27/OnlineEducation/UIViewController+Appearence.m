//
//  UIViewController+Appearence.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/3/27.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "UIViewController+Appearence.h"

@implementation UIViewController (Appearence)
- (UIBarButtonItem*)createBackButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    NSString *imgName = @"navigation_back_icon";
    if (imgName) {
        UIImage *normal = [UIImage imageNamed:imgName];
        [button setImage:normal forState:UIControlStateNormal];
        button.frame = CGRectMake(0.0f, .0f, normal.size.width, normal.size.height);
    }
    //  ios7系统会把self.navigationItem.rightBarButtonItem 这个button左移20像素
    BOOL isIOS7 = [[UIDevice currentDevice].systemVersion floatValue] >= 7.0;
    if (isIOS7) {
    }else{
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    }
    [button addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:button];
    return back;
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
