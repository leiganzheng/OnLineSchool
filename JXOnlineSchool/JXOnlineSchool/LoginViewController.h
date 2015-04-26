//
//  LoginViewController.h
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/15.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXBaseViewController.h"

typedef  void(^Finish)();

@interface LoginViewController : JXBaseViewController
@property (nonatomic,strong) Finish finish;
@end
