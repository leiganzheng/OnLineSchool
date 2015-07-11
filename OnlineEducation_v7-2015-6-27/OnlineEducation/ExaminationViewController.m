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
@property(nonatomic,strong) UITextView *textView;
@property(nonatomic,strong) UIButton *ABtn;
@property(nonatomic,strong) UIButton *BBtn;
@property(nonatomic,strong) UIButton *CBtn;
@property(nonatomic,strong) UIButton *DBtn;
@property(nonatomic,strong) UIView *bgV;
@end

@implementation ExaminationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"试卷名称";
    [self.list addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.answers addTarget:self action:@selector(anButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self customUI];
    [self shortAnswerUI ];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark:- private method
- (void)loadTitle{
    NSString *temStr;
    switch (self.testType) {
        case kSigleType:
            temStr = @"单选题";
            break;
        case KDoubleType:
            temStr = @"多选题";
            break;
        case kShortAnswer:
            temStr = @"简答题";
            break;
        default:
            break;
    }
    [self.titleButton setTitle:temStr forState:UIControlStateNormal];
}
- (void)commonUI{
    self.bgV = [[UIView alloc] initWithFrame:CGRectMake(40, _textView.frame.size.height + _textView.frame.origin.y + 60, self.view.bounds.size.width-80, 105)];
    _bgV.backgroundColor = [UIColor whiteColor];
    _bgV.layer.borderWidth = 0.5;
    _bgV.layer.borderColor = [kCyColorFromRGB(211, 211, 211) CGColor];
    
    CGFloat height = 40;
    CGFloat width = 85;
    self.ABtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.ABtn.frame = CGRectMake(0,0, width, height);
    [self.ABtn setTitle:@"A" forState:UIControlStateNormal];
    self.ABtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [self.ABtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.ABtn.backgroundColor = [UIColor lightGrayColor];
    //    self.ABtn.titleEdgeInsets = UIEdgeInsetsMake(0, -240, 0, 0);
    //    self.ABtn.imageEdgeInsets = UIEdgeInsetsMake(0, -240, 0, 0);

    [_bgV addSubview:self.ABtn];
    
    CGFloat x = _bgV.bounds.size.width-width;
    self.BBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.BBtn.frame = CGRectMake(x,0 , width, height);
    [self.BBtn setTitle:@"B" forState:UIControlStateNormal];
    self.BBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [self.BBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.BBtn.backgroundColor = [UIColor lightGrayColor];
    //    self.BBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -240, 0, 0);
    //    self.BBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -240, 0, 0);

    [_bgV addSubview:self.BBtn];
    
    CGFloat y = _bgV.bounds.size.height-height;
    
    self.CBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.CBtn.frame = CGRectMake(0,y, width, height);
    [self.CBtn setTitle:@"C" forState:UIControlStateNormal];
    self.CBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [self.CBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.CBtn.backgroundColor = [UIColor lightGrayColor];
    //    self.CBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -240, 0, 0);
    //    self.CBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -240, 0, 0);

    [_bgV addSubview:self.CBtn];
    
    
    self.DBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.DBtn.frame = CGRectMake(x,y, width, height);
    [self.DBtn setTitle:@"D" forState:UIControlStateNormal];
    self.DBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [self.DBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.DBtn.backgroundColor = [UIColor lightGrayColor];
//    self.DBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -240, 0, 0);
//    self.DBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -240, 0, 0);
    [_bgV addSubview:self.DBtn];
    
    [self.view addSubview:_bgV];
}
- (void)shortAnswerUI{
    self.bgV.hidden = YES;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10,_textView.frame.size.height + _textView.frame.origin.y + 60, 300, 40);
    [button setTitle:@"开始作答" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    button.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    button.layer.borderWidth = 0.5;
    button.titleEdgeInsets = UIEdgeInsetsMake(0, -240, 0, 0);
    [self.view addSubview:button];
}

- (void)customUI{
    self.textView = [[UITextView  alloc] initWithFrame:CGRectMake(10, 118, 300, 140)];
    self.textView.textColor = [UIColor blackColor];//设置textview里面的字体颜色
     self.textView.font = [UIFont fontWithName:@"Arial" size:18.0];//设置字体名字和字体大小
     self.textView.backgroundColor = [UIColor whiteColor];//设置它的背景颜色
     self.textView.text = @"Now is the time for all good developers to come to serve their country.\n\nNow is the time for all good developers to come to serve their country.";//设置它显示的内容
     self.textView.returnKeyType = UIReturnKeyDefault;//返回键的类型
     self.textView.keyboardType = UIKeyboardTypeDefault;//键盘类型
     self.textView.scrollEnabled = NO;//是否可以拖动
     self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
    self.textView.editable = NO;
     [self.view addSubview: self.textView];//加入到整个页面中
    
    }

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
