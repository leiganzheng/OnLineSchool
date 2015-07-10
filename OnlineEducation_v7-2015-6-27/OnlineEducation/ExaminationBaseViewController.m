//
//  ExaminationBaseViewController.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/7/11.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "ExaminationBaseViewController.h"
@interface ExaminationBaseViewController ()

@end

@implementation ExaminationBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self headerView];
    [self footerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - private method
- (void)headerView{
    int height = 44;
    self.header = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, height)];
    _header.backgroundColor = [UIColor whiteColor];
    _header.layer.borderWidth = 0.5;
    _header.layer.borderColor = [kCyColorFromRGB(211, 211, 211) CGColor];

    
    self.titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _titleButton.frame = CGRectMake(0,0 , 80, height);
    [_titleButton setTitle:@"单选题" forState:UIControlStateNormal];
    _titleButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [_titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _titleButton.backgroundColor = [UIColor clearColor];
    [_header addSubview:self.titleButton];
    
    self.pagesButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _pagesButton.frame = CGRectMake(self.view.bounds.size.width-80,0 , 80, height);
    [_pagesButton setTitle:@"1/10" forState:UIControlStateNormal];
    _pagesButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [_pagesButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _pagesButton.backgroundColor = [UIColor clearColor];
        [_header addSubview:self.pagesButton];
    
    [self.view addSubview:_header];
}

- (void)footerView{
    NSArray *titles = @[@"右滑",@"答题卡",@"答案",@"左滑"];
    int height = 50;
    
    self.footer = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-height, self.view.bounds.size.width, height)];
    _footer.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i< titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*(self.view.bounds.size.width/titles.count),0 , self.view.bounds.size.width/titles.count, height);
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor whiteColor];
        button.layer.borderWidth = 0.5;
        button.layer.borderColor = [kCyColorFromRGB(211, 211, 211) CGColor];
        [_footer addSubview:button];
        if (i == 1) {//答题卡
            self.list = button;
        }else if (i == 2){//答案
            self.answers = button;
        }
    }
    [self.view addSubview:_footer];
}


@end
