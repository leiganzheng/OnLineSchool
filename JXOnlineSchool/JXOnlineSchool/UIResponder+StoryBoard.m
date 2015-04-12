//
//  UIResponder+StoryBoard.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/11.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "UIResponder+StoryBoard.h"

@implementation UIResponder (StoryBoard)

//从 Main.storyboard 初始化一个当前类
// 从 Main.storyboard 中创建一个使用了当前类作为 StoryboardID 的类
+ (instancetype)CreateFromMainStoryboard{
    return  [self CreateFromStoryboardWithName:@"Main"];
}
// 从 storyboardName.storyboard 初始化一个当前类
// 从 storyboardName.storyboard 中创建一个使用了当前类作为 StoryboardID 的类
+ (instancetype)CreateFromStoryboardWithName:(NSString *)name{
    NSString *classFullName = NSStringFromClass(self);
    NSString *className = [[classFullName componentsSeparatedByString:@"."] lastObject];
    UIStoryboard *mainBoard = [UIStoryboard storyboardWithName:name bundle:nil];
    return [mainBoard instantiateViewControllerWithIdentifier:className];
}
@end
