//
//  CustomView.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/7/22.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView
- (instancetype)initWithFrame:(CGRect)frame block:(FinishBlock)block{
    if(self=[super initWithFrame:frame])
    {
        self.block = block;
        self.frame = frame;
        self.backgroundColor = kCyColorFromRGBA(0, 0, 0, 0.5);
        [self layoutUI];
    }
    return self;
}
- (void)layoutUI{
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-212-190-34, self.bounds.size.width, 190)];
    self.headerView.backgroundColor = kCyColorFromRGB(231, 229, 230);
    [self addSubview:self.headerView];
    
    self.contentV = [[UITextView  alloc] initWithFrame:CGRectMake(12, 8, self.bounds.size.width-24, 124)];
    self.contentV.textColor = [UIColor lightGrayColor];
    self.contentV.font = [UIFont fontWithName:@"Arial" size:16.0];
    self.contentV.backgroundColor = [UIColor whiteColor];
//    self.contentV.text = @"Now is the time for all good developers to come to serve their country.\n\nNow is the time for all good developers to come to serve their country.";
    self.contentV.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [Tools configureView:self.contentV isCorner:YES];
    [self.contentV becomeFirstResponder];
    [self.headerView addSubview: self.contentV];

    int y = self.contentV.frame.origin.x + self.contentV.bounds.size.height + 12;
    int height = 30;
    
    self.cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancel.frame = CGRectMake(12,y , 65, height);
    [self.cancel setTitle:@"取消" forState:UIControlStateNormal];
    self.cancel.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [self.cancel setTitleColor:kRedColor forState:UIControlStateNormal];
    self.cancel.backgroundColor = [UIColor clearColor];
    [self.cancel addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:self.cancel];
    
    self.save = [UIButton buttonWithType:UIButtonTypeCustom];
    self.save.frame = CGRectMake(self.bounds.size.width-65-12,y , 65, height);
    [self.save setTitle:@"保存" forState:UIControlStateNormal];
    self.save.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [self.save setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.save.backgroundColor = kRedColor;
    [self.save addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];

    [Tools configureView:self.save isCorner:YES];
    [self.headerView addSubview:self.save];
   
}
- (void)cancelAction{
    [self.contentV resignFirstResponder];
    self.block(YES,nil);
}
- (void)saveAction{
    [self.contentV resignFirstResponder];
   self.block(NO,self.contentV.text);
}
@end
