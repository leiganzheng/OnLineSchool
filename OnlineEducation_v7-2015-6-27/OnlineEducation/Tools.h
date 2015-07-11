//
//  Tools.h
//  OnlineEducation
//
//  Created by leiganzheng on 15/7/11.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tools : NSObject
+(instancetype)sharedTool;
+(void)configureView:(id)views isCorner:(BOOL)flag;
@end
