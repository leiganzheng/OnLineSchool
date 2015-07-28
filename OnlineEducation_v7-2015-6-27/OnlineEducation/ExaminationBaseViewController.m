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
    [Tools configureView:_header isCorner:false];

    
    self.titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _titleButton.frame = CGRectMake(10,0 , 80, height);
    [_titleButton setTitle:@"单选题" forState:UIControlStateNormal];
    [_titleButton setImage:[UIImage imageNamed:@"list"] forState:UIControlStateNormal];
    _titleButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [_titleButton setTitleColor:kRedColor forState:UIControlStateNormal];
    _titleButton.backgroundColor = [UIColor clearColor];
    _titleButton.titleEdgeInsets = UIEdgeInsetsMake(0, self.titleButton.titleLabel.frame.size.width, 0, 0);
    _titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, -self.titleButton.imageView.frame.size.width+10, 0, 0);

    [_header addSubview:self.titleButton];
    
    self.pagesButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _pagesButton.frame = CGRectMake(self.view.bounds.size.width-70+3,0 , 22, height);
    [_pagesButton setTitle:@"1" forState:UIControlStateNormal];
    _pagesButton.titleLabel.textAlignment = NSTextAlignmentRight;
    _pagesButton.titleLabel.font = [UIFont systemFontOfSize:18.0f];
    [_pagesButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _pagesButton.backgroundColor = [UIColor clearColor];
    [_header addSubview:self.pagesButton];
    
    UIButton *totalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    totalBtn.frame = CGRectMake(self.view.bounds.size.width-50,0 , 30, height);
    [totalBtn setTitle:@"/10" forState:UIControlStateNormal];
    totalBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    totalBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [totalBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    totalBtn.backgroundColor = [UIColor clearColor];
    [_header addSubview:totalBtn];
    
    [self.view addSubview:_header];
}

- (void)footerView{
    NSArray *titles = @[@"",@"答题卡",@"答案",@""];
    int height = 50;
    
    self.footer = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-height, self.view.bounds.size.width, height)];
    [Tools configureView:self.footer isCorner:NO];
    _footer.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i< titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*(self.view.bounds.size.width/titles.count),0 , self.view.bounds.size.width/titles.count, height);
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        button.backgroundColor = [UIColor clearColor];
        
        [_footer addSubview:button];
        if (i == 1) {//答题卡
            button.titleEdgeInsets = UIEdgeInsetsMake(30, -15, 0, 0);
            button.imageEdgeInsets = UIEdgeInsetsMake(-14, 20, 0, 0);
            [button setImage:[UIImage imageNamed:@"topic-card"] forState:UIControlStateNormal];
            self.list = button;
        }else if (i == 2){//答案
            button.titleEdgeInsets = UIEdgeInsetsMake(30, -26, 0, 0);
            button.imageEdgeInsets = UIEdgeInsetsMake(-14, 24, 0, 0);
            [button setImage:[UIImage imageNamed:@"answer-black"] forState:UIControlStateNormal];
            self.answers = button;
        }else if (i == 0){//左
            button.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
            [button setImage:[UIImage imageNamed:@"arrow-left-gray"] forState:UIControlStateNormal];
            self.leftButton = button;
        }
        else if (i == 3){//右
            button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -10);
            [button setImage:[UIImage imageNamed:@"arrow-right-black"] forState:UIControlStateNormal];
            self.rightButton = button;
        }

    }
    [self.view addSubview:_footer];
}


@end
