//
//  SheetViewController.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/7/10.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "SheetViewController.h"

@interface SheetViewController ()

@end

@implementation SheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"答题卡";
    // Do any additional setup after loading the view.
    [self contentButtons];
    self.header.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - private method

-  (void)contentButtons{
    //
    NSArray *titles1 = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    int height1 = 25;
    for (int i = 0; i< titles1.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i<8) {
            button.frame = CGRectMake(i*((self.view.bounds.size.width)/titles1.count)+20,88 , height1, height1);
        }else{
            button.frame = CGRectMake((i-8)*((self.view.bounds.size.width)/titles1.count)+20,138 , height1, height1);

        }
        [button setTitle:titles1[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor clearColor];
        [Tools configureView:button isCorner:NO];
        [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
   
    //
    NSArray *titles = @[@"答对",@"答错",@"未答",@"简答题"];
    int height = 36;
    UIView *bgV = [[UIView alloc] initWithFrame:CGRectMake(7, self.view.bounds.size.height-height-18-36, self.view.bounds.size.width-14, height)];
    bgV.backgroundColor = kCyColorFromRGB(228, 224, 225);
    [Tools configureView:bgV isCorner:YES];
    for (int i = 0; i< titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*((self.view.bounds.size.width-14)/titles.count),0 , (self.view.bounds.size.width-14)/titles.count, height);
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor whiteColor];
        button.layer.borderWidth = 0.5;
        button.layer.borderColor = [kCyColorFromRGB(211, 211, 211) CGColor];
        [bgV addSubview:button];
    }
    [self.view addSubview:bgV];

}
- (void)buttonAction{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
