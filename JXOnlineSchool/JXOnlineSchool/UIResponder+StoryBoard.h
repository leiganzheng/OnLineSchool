//
//  UIResponder+StoryBoard.h
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/11.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

//为 UIView, UIViewController ... 提供一个公有的初始化方法

@interface UIResponder (StoryBoard)
+ (instancetype)CreateFromMainStoryboard;
+ (instancetype)CreateFromStoryboardWithName:(NSString *)name;
@end
