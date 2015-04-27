//
//  CustomShareViewController.m
//  
//
//  Created by leiganzheng on 14/11/24.
//  Copyright (c) 2014年 All rights reserved.
//

#import "CustomShareViewController.h"
#import "Define.h"
#define kWidth 60
#define kHeight 60
@interface CustomShareViewController ()

@property (strong, nonatomic) IBOutlet UIView *customView;
@property (weak, nonatomic) IBOutlet UIButton *weixin;
@property (weak, nonatomic) IBOutlet UIButton *weixinzone;
@property (weak, nonatomic) IBOutlet UIButton *qq;
@property (weak, nonatomic) IBOutlet UIButton *message;
@property (weak, nonatomic) IBOutlet UIButton *sina;
@property (weak, nonatomic) IBOutlet UIButton *qzone;
@property (weak, nonatomic) IBOutlet UIButton *email;
@property (weak, nonatomic) IBOutlet UIButton *link;
@end

@implementation CustomShareViewController

- (id)initWithBlock:(FinishBlock)finish{
    self = [super init];
    if (self) {
        self.block = finish;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor alloc] initWithWhite:0 alpha:0.65];
    [self layoutSubViews];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if (touch.view == self.customView) {
        return NO;
    }
    return YES;
}

#pragma mark - private method
- (void)layoutSubViews{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"shareView" owner:self options:nil];
    self.customView = views[0];
    self.customView.frame = CGRectMake(0,  kScreenHeight + self.customView.frame.size.width, kScreenWidth, self.customView.frame.size.height);
     [self.view addSubview:self.customView];
    [UIView animateWithDuration:0.5 animations:^{
        self.customView.frame = CGRectMake(0,  kScreenHeight - self.customView.frame.size.height , self.customView.frame.size.width, self.customView.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];

   
    
    
    [self.weixin setTitleEdgeInsets: UIEdgeInsetsMake(0, -60, -80, 0)];
    [self.weixinzone setTitleEdgeInsets: UIEdgeInsetsMake(0, -60, -80, -10)];
    [self.qq setTitleEdgeInsets: UIEdgeInsetsMake(0, -60, -80, 0)];
    [self.message setTitleEdgeInsets: UIEdgeInsetsMake(0, -60, -80, 0)];
    [self.sina setTitleEdgeInsets: UIEdgeInsetsMake(0, -60, -80, 0)];
    [self.qzone setTitleEdgeInsets: UIEdgeInsetsMake(0, -60, -80, 0)];
    [self.email setTitleEdgeInsets: UIEdgeInsetsMake(0, -60, -80, 0)];
    [self.link setTitleEdgeInsets: UIEdgeInsetsMake(0, -60, -80, 0)];
}

- (void)buttonClicked:(UIButton *)sender{
    [self remove:(ShareType)sender.tag];
}

- (void)cancelButtonClicked{
    [self remove:-1];//-1代表没有
}

- (void)remove:(ShareType)type {
    [UIView animateWithDuration:0.2 animations:^{
        self.customView.center = CGPointMake(self.customView.center.x, self.view.bounds.size.height+self.customView.bounds.size.height/2.0);
    } completion:^(BOOL finished) {
        self.block(type);
    }];
}
- (void)tapAction{
    [self remove:-1];//-1代表没有
}
@end
