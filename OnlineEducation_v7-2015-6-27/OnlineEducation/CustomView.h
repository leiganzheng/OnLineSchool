//
//  CustomView.h
//  OnlineEducation
//
//  Created by leiganzheng on 15/7/22.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FinishBlock)(BOOL isCancel, id obj);

@interface CustomView : UIView
@property(nonatomic,strong) UIButton *save;
@property(nonatomic,strong) UIButton *cancel;
@property(nonatomic,strong) UIView *headerView;
@property(nonatomic,strong) UITextView *contentV;
@property(nonatomic,strong) FinishBlock block;
- (instancetype)initWithFrame:(CGRect)frame block:(FinishBlock)block;
@end
