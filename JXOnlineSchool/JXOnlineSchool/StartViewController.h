//
//  StartViewController.h
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/15.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXBaseViewController.h"
typedef void(^Finish)();

@interface StartViewController : JXBaseViewController <UIScrollViewDelegate>
@property (nonatomic,strong) Finish finish;
@end
