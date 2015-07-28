//
//  ExaminationViewController.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/7/11.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "ExaminationViewController.h"
#import "SheetViewController.h"
#import "ResultViewController.h"
#import "CustomView.h"

@interface ExaminationViewController ()
@property(nonatomic,strong) UITextView *textView;
@property(nonatomic,strong) UITextView *answerTextView;
@property(nonatomic,strong) UIButton *ABtn;
@property(nonatomic,strong) UIButton *BBtn;
@property(nonatomic,strong) UIButton *CBtn;
@property(nonatomic,strong) UIButton *DBtn;
@property (nonatomic,strong) UIButton *shortAnswerBtn;
@property(nonatomic,strong) UIView *bgV;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,assign) NSInteger index;
@property (nonatomic,strong) Stack *tempStack;
@property (nonatomic,strong) CustomView *answerView;
@property (nonatomic,assign) BOOL isMulSelected;
@property (nonatomic,strong) UIView *answerV;
@end

@implementation ExaminationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.customTitle;
    [self.list addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.answers addTarget:self action:@selector(anButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    //
    self.dataArray = @[@"0",@"1",@"2",@"0",@"1",@"2",@"0",@"1",@"2",@"0"];
    self.index = 1;
    self.tempStack = [[Stack alloc] init];
    //
    [self customUI];
    self.isMulSelected = NO;
    [self commonUI];
//    [self shortAnswerUI ];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark:- private method
- (void)loadTitleWith:(NSInteger)index{
    NSString *temStr;
    switch (index) {
        case 0:
            temStr = @"单选题";
            [self showCommonUI:NO];
            break;
        case 1:
            temStr = @"多选题";
            [self showCommonUI:YES];
            break;
        case 2:
            temStr = @"简答题";
             [self shortAnswerUI ];
            break;
        default:
            break;
    }
    [self.titleButton setTitle:temStr forState:UIControlStateNormal];
    [self.titleButton setImage:[UIImage imageNamed:@"list"] forState:UIControlStateNormal];
    [self.pagesButton setTitle:[NSString stringWithFormat:@"%li",(long)self.index] forState:UIControlStateNormal];
}
-  (void)rightButtonAction{
     [self.leftButton setImage:[UIImage imageNamed:@"arrow-left-black"] forState:UIControlStateNormal];
    NSInteger index = self.index - 1;
    if (index == self.dataArray.count) {return;}
      self.index ++ ;
    if (self.index <= self.dataArray.count) {
        [self loadTitleWith:[[self.dataArray objectAtIndex:index] integerValue]];
    }
    if (self.index == self.dataArray.count) {
        [self.rightButton setImage:[UIImage imageNamed:@"arrow-right-gray"] forState:UIControlStateNormal];
        UIStoryboard * storyboard = [ UIStoryboard storyboardWithName:@"Main" bundle:nil ];
        ResultViewController *result = [storyboard instantiateViewControllerWithIdentifier:@"ResultViewID"];
        [self.navigationController pushViewController:result animated:YES];
    }
}
- (void)leftButtonAction{
    NSInteger index = self.index - 1;
    if (index == 0) {return;}
    self.index --;
    if (index >=0) {
        if (index==1) {
            [self.leftButton setImage:[UIImage imageNamed:@"arrow-left-gray"] forState:UIControlStateNormal];
        }
        [self.rightButton setImage:[UIImage imageNamed:@"arrow-right-black"] forState:UIControlStateNormal];
        [self loadTitleWith:[[self.dataArray objectAtIndex:index] integerValue]];
    }
}
- (void)answer{
    
    self.bgV.frame = CGRectMake(self.bgV.frame.origin.x, self.textView.frame.origin.y+self.textView.frame.size.height+20, self.bgV.frame.size.width, self.bgV.frame.size.height);
    
    self.answerV = [[UIView alloc] initWithFrame:CGRectMake(10, self.bgV.frame.origin.y+self.bgV.frame.size.height+20, self.view.bounds.size.width-20, 130)];
    _answerV.backgroundColor = [UIColor whiteColor];
    [Tools configureView:_answerV isCorner:YES];
    [self.view addSubview:_answerV];
    
    UIButton *icon = [UIButton buttonWithType:UIButtonTypeCustom];
    icon.frame = CGRectMake(8, _answerV.frame.origin.y+6, 42, 17);
    icon.backgroundColor = [UIColor clearColor];
    icon.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [icon setTitle:@"解析" forState:UIControlStateNormal];
    [icon setBackgroundImage:[UIImage imageNamed:@"flag"] forState:UIControlStateNormal];
    [self.view addSubview:icon];
    
    UILabel *right = [[UILabel alloc] initWithFrame:CGRectMake(10, 26, 60, 21)];
    right.backgroundColor = [UIColor clearColor];
    right.textColor = [UIColor darkGrayColor];
    right.font = [UIFont systemFontOfSize:12.0];
    right.text = @"正确答案：";
    [_answerV addSubview:right];
    
    UILabel *an = [[UILabel alloc] initWithFrame:CGRectMake(70, 26, 20, 21)];
    an.backgroundColor = [UIColor clearColor];
    an.font = [UIFont systemFontOfSize:12.0];
    an.textColor = kGreenColor;
    an.text = @"C";
    [_answerV addSubview:an];
    
    UILabel *your = [[UILabel alloc] initWithFrame:CGRectMake(100, 26, 60, 21)];
    your.backgroundColor = [UIColor clearColor];
    your.textColor = [UIColor darkGrayColor];
    your.font = [UIFont systemFontOfSize:12.0];
    your.text = @"您的答案：";
    [_answerV addSubview:your];
    
    UILabel *yourAn = [[UILabel alloc] initWithFrame:CGRectMake(160, 26, 20, 21)];
    yourAn.backgroundColor = [UIColor clearColor];
    yourAn.font = [UIFont systemFontOfSize:12.0];
    yourAn.textColor = kGreenColor;
    yourAn.text = @"A";
    [_answerV addSubview:yourAn];
    
    UILabel *total = [[UILabel alloc] initWithFrame:CGRectMake(10, 46, 60, 21)];
    total.backgroundColor = [UIColor clearColor];
    total.textColor = [UIColor darkGrayColor];
    total.font = [UIFont systemFontOfSize:12.0];
    total.text = @"统     计：";
    [_answerV addSubview:total];
    
    UILabel *count = [[UILabel alloc] initWithFrame:CGRectMake(60, 46, 200, 21)];
    count.backgroundColor = [UIColor clearColor];
    count.textColor = [UIColor darkGrayColor];
    count.font = [UIFont systemFontOfSize:12.0];
    count.text = @"共计有1126人答过，共有538人答对";
    [_answerV addSubview:count];
    
    UILabel *explain = [[UILabel alloc] initWithFrame:CGRectMake(10, 66, 60, 21)];
    explain.backgroundColor = [UIColor clearColor];
    explain.textColor = [UIColor darkGrayColor];
    explain.font = [UIFont systemFontOfSize:12.0];
    explain.text = @"参考解析：";
    [_answerV addSubview:explain];

    self.answerTextView = [[UITextView  alloc] initWithFrame:CGRectMake(10, explain.frame.origin.y+12, self.view.bounds.size.width-40, 50)];
    self.answerTextView.textColor = [UIColor blackColor];
    self.answerTextView.font = [UIFont fontWithName:@"Arial" size:12.0];
    self.answerTextView.backgroundColor = [UIColor clearColor];
    self.answerTextView.text = @"解析解析解析解析解析解析解析解析解析解析解析解析解析解析解析解析解析解析解析解析解析解析解析解析解析解析解析解析解析解析";
    self.answerTextView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.answerTextView.editable = NO;
    self.answerTextView.scrollEnabled = NO;
    
    [_answerV addSubview: self.answerTextView];

}

- (void)commonUI{
    self.bgV = [[UIView alloc] initWithFrame:CGRectMake(40, _textView.frame.size.height + _textView.frame.origin.y + 60, self.view.bounds.size.width-80, 105)];
    _bgV.backgroundColor = [UIColor clearColor];
    
    CGFloat height = 40;
    CGFloat width = 85;
    self.ABtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.ABtn.frame = CGRectMake(0,0, width, height);
    [self.ABtn setTitle:@"A" forState:UIControlStateNormal];
    self.ABtn.titleLabel.font = [UIFont systemFontOfSize:19.0f];
    [self.ABtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.ABtn setImage:[UIImage imageNamed:@"radio"] forState:UIControlStateNormal];
    self.ABtn.backgroundColor = kCyColorFromRGB(243, 242, 241);
    self.ABtn.titleEdgeInsets = UIEdgeInsetsMake(0, self.ABtn.titleLabel.frame.size.width+5, 0, 0);
        self.ABtn.imageEdgeInsets = UIEdgeInsetsMake(0, -self.ABtn.imageView.frame.size.width-10, 0, 0);
    [self.ABtn addTarget:self action:@selector(AButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_bgV addSubview:self.ABtn];
    
    CGFloat x = _bgV.bounds.size.width-width;
    self.BBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.BBtn.frame = CGRectMake(x,0 , width, height);
    [self.BBtn setTitle:@"B" forState:UIControlStateNormal];
    self.BBtn.titleLabel.font = [UIFont systemFontOfSize:19.0f];
    [self.BBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.BBtn setImage:[UIImage imageNamed:@"radio"] forState:UIControlStateNormal];
    [self.BBtn addTarget:self action:@selector(BButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.BBtn.backgroundColor = kCyColorFromRGB(243, 242, 241);
        self.BBtn.titleEdgeInsets = UIEdgeInsetsMake(0, self.BBtn.titleLabel.frame.size.width+5, 0, 0);
        self.BBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -self.BBtn.imageView.frame.size.width-10, 0, 0);

    [_bgV addSubview:self.BBtn];
    
    CGFloat y = _bgV.bounds.size.height-height;
    
    self.CBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.CBtn.frame = CGRectMake(0,y, width, height);
    [self.CBtn setTitle:@"C" forState:UIControlStateNormal];
    self.CBtn.titleLabel.font = [UIFont systemFontOfSize:19.0f];
    [self.CBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.CBtn setImage:[UIImage imageNamed:@"radio"] forState:UIControlStateNormal];
    [self.CBtn addTarget:self action:@selector(CButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.CBtn.backgroundColor = kCyColorFromRGB(243, 242, 241);
        self.CBtn.titleEdgeInsets = UIEdgeInsetsMake(0, self.CBtn.titleLabel.frame.size.width+5, 0, 0);
        self.CBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -self.DBtn.imageView.frame.size.width-10, 0, 0);

    [_bgV addSubview:self.CBtn];
    
    
    self.DBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.DBtn.frame = CGRectMake(x,y, width, height);
    [self.DBtn setTitle:@"D" forState:UIControlStateNormal];
    self.DBtn.titleLabel.font = [UIFont systemFontOfSize:19.0f];
    [self.DBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.DBtn setImage:[UIImage imageNamed:@"radio"] forState:UIControlStateNormal];
    [self.DBtn addTarget:self action:@selector(DButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.DBtn.backgroundColor = kCyColorFromRGB(243, 242, 241);
    self.DBtn.titleEdgeInsets = UIEdgeInsetsMake(0, self.DBtn.titleLabel.frame.size.width+5, 0, 0);
    self.DBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -self.DBtn.imageView.frame.size.width-10, 0, 0);
    [_bgV addSubview:self.DBtn];
    [Tools configureView:@[self.ABtn,self.BBtn,self.CBtn,self.DBtn] isCorner:YES];

    [self.view addSubview:_bgV];
}
- (void)shortAnswerUI{
    self.bgV.hidden = YES;
     self.shortAnswerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.shortAnswerBtn.frame = CGRectMake(10,_textView.frame.size.height + _textView.frame.origin.y + 60,self.view.bounds.size.width-20, 40);
    [self.shortAnswerBtn setTitle:@"开始作答" forState:UIControlStateNormal];
    self.shortAnswerBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [self.shortAnswerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.shortAnswerBtn.backgroundColor = [UIColor whiteColor];
    self.shortAnswerBtn.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.shortAnswerBtn.layer.borderWidth = 0.5;
    self.shortAnswerBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -235, 0, 0);
    [self.shortAnswerBtn addTarget:self action:@selector(answerQuestion) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.shortAnswerBtn];
}
- (void)showCommonUI:(BOOL)isMulSelected{
    NSString *imageName;
    if (isMulSelected) {
        self.isMulSelected = YES;
        imageName = @"checkbox";
    }else {
        self.isMulSelected = NO;
        imageName = @"radio";
    }
    for(UIButton * btn in self.bgV.subviews){
        btn.backgroundColor = kCyColorFromRGB(243, 242, 241);
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    self.bgV.hidden = NO;
    self.shortAnswerBtn.hidden = YES;
}
- (void)answerQuestion{
    if (!self.answerView) {
        self.answerView = [[CustomView alloc] initWithFrame:self.view.bounds block:^(BOOL isCancel, id obj) {
            if (isCancel) {
                [UIView animateWithDuration:0.3 animations:^{
                    self.answerView.center = CGPointMake(self.view.center.x, kScreenHeight*2);
                }];
            }else{
                [UIView animateWithDuration:0.3 animations:^{
                    self.answerView.center = CGPointMake(self.view.center.x, kScreenHeight*2);
                }];
            }
        }];
        self.answerView.center = CGPointMake(self.view.center.x, kScreenHeight);
        [self.view addSubview:self.answerView];
        [UIView animateWithDuration:0.2 animations:^{
            self.answerView.center = self.view.center;
        }];
    }else{
        [self.answerView.contentV becomeFirstResponder];
        [UIView animateWithDuration:0.2 animations:^{
            self.answerView.center = self.view.center;
        }];
    }
}
- (void)customUI{
    self.textView = [[UITextView  alloc] initWithFrame:CGRectMake(10, 118, self.view.bounds.size.width-20, 120)];
    self.textView.textColor = [UIColor darkGrayColor];
     self.textView.font = [UIFont fontWithName:@"Arial" size:18.0];
     self.textView.backgroundColor = [UIColor clearColor];
     self.textView.text = @"取得建造师资格证并经()后，方有资格以建造师名义担任建设工程项目施工的想买经理。\n    A.登记B.注册C.备案D.所在单位考核合格";
     self.textView.scrollEnabled = NO;
     self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.textView.editable = NO;
     [self.view addSubview: self.textView];
}
- (void)AButtonAction:(UIButton *)sender{
    if (self.isMulSelected) {
        sender.backgroundColor = kRedColor;
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sender setImage:[UIImage imageNamed:@"checkbox-checked"] forState:UIControlStateNormal];
    }else {
        [self layoutButton:sender];
    }

}
- (void)BButtonAction:(UIButton *)sender{
    if (self.isMulSelected) {
        sender.backgroundColor = kRedColor;
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sender setImage:[UIImage imageNamed:@"checkbox-checked"] forState:UIControlStateNormal];
    }else {
        [self layoutButton:sender];
    }

}
- (void)CButtonAction:(UIButton *)sender{
    if (self.isMulSelected) {
        sender.backgroundColor = kRedColor;
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sender setImage:[UIImage imageNamed:@"checkbox-checked"] forState:UIControlStateNormal];
    }else {
        [self layoutButton:sender];
    }

}
- (void)DButtonAction:(UIButton *)sender{
    if (self.isMulSelected) {
        sender.backgroundColor = kRedColor;
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sender setImage:[UIImage imageNamed:@"checkbox-checked"] forState:UIControlStateNormal];
    }else {
        [self layoutButton:sender];
    }

}
- (void)layoutButton:(UIButton *)sender{
    sender.backgroundColor = kRedColor;
    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sender setImage:[UIImage imageNamed:@"radio-checked"] forState:UIControlStateNormal];
    for(UIButton * btn in self.bgV.subviews){
        if (btn!=sender) {
            btn.backgroundColor = kCyColorFromRGB(243, 242, 241);
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"radio"] forState:UIControlStateNormal];
            
        }
    }

}
- (void)buttonAction{
        
    [self.answers setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.answers setImage:[UIImage imageNamed:@"answer-black"] forState:UIControlStateNormal];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[SheetViewController alloc]init]];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}
- (void)anButtonAction{
    [self.list setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.list setImage:[UIImage imageNamed:@"topic-card"] forState:UIControlStateNormal];
    [self.answers setTitleColor:kRedColor forState:UIControlStateNormal];
    [self.answers setImage:[UIImage imageNamed:@"answer-red"] forState:UIControlStateNormal];
    [self answer];
}
@end
