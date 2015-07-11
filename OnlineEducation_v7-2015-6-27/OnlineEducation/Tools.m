//
//  Tools.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/7/11.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "Tools.h"

@implementation Tools
+(instancetype)sharedTool {
    static Tools* sharedMyTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyTool = [[self alloc] init];
    });
    return sharedMyTool;
}
+(void)configureView:(id)views isCorner:(BOOL)flag{
    if ([views isKindOfClass:[NSArray class]]) {
        for (id v in views) {
            UIView *tempView =  (UIView *)v;
            if (flag){
                tempView.layer.masksToBounds = YES;
                tempView.layer.cornerRadius = 5;
            }
            tempView.layer.borderWidth = 0.5;
            tempView.layer.borderColor = [kCyColorFromRGB(211, 211, 211) CGColor];
        }
    }else {
         UIView *tempView =  (UIView *)views;
        if (flag){
            tempView.layer.masksToBounds = YES;
            tempView.layer.cornerRadius = 5;
        }
        tempView.layer.borderWidth = 0.5;
        tempView.layer.borderColor = [kCyColorFromRGB(211, 211, 211) CGColor];
    }
}

@end
