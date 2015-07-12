//
//  InformationViewController.h
//  OnlineEducation
//
//  Created by leiganzheng on 15/3/27.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REMenu.h"
@interface InformationViewController : OLBaseViewController <UITableViewDelegate,UITableViewDataSource,REMenuDelegate>
@property(nonatomic,assign) BOOL flag;//yes: 试卷
@end
