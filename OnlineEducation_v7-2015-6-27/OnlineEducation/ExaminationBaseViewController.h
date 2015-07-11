//
//  ExaminationBaseViewController.h
//  OnlineEducation
//
//  Created by leiganzheng on 15/7/11.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

//题型
typedef NS_ENUM(NSInteger, TestType) {
    kSigleType = 0,//单选题
    KDoubleType = 1,//多选题
    kShortAnswer = 2//简答题
};
@interface ExaminationBaseViewController : OLBaseViewController
@property(nonatomic,strong) UIButton *titleButton;
@property(nonatomic,strong) UIButton *pagesButton;
@property(nonatomic,strong) UIButton *list;
@property(nonatomic,strong) UIButton *answers;
@property(nonatomic,strong) UIView *header;
@property(nonatomic,strong) UIView *footer;
@property(nonatomic,assign) TestType testType;
@end
