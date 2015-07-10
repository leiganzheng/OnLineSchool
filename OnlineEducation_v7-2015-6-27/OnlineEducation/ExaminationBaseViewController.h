//
//  ExaminationBaseViewController.h
//  OnlineEducation
//
//  Created by leiganzheng on 15/7/11.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExaminationBaseViewController : OLBaseViewController
@property(nonatomic,strong) UIButton *titleButton;
@property(nonatomic,strong) UIButton *pagesButton;
@property(nonatomic,strong) UIButton *list;
@property(nonatomic,strong) UIButton *answers;
@property(nonatomic,strong) UIView *header;
@property(nonatomic,strong) UIView *footer;
@end
