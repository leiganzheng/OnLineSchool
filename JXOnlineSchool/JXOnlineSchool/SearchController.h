//
//  SearchController.h
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/15.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface SearchController : NSObject

- (instancetype)initWithContentsController:(UIViewController *)viewController searchBarFrame:(CGRect)frame selected:(void (^)(id))selectedBlock cancel:(void (^)())cancelBlock;

@property (nonatomic, copy) void (^selectedBlock)(id);      // 被选中时候的回掉
@property (nonatomic, copy) void (^cancelBlock)();      // 取消后的回掉

- (void)becomeFirstResponder;
- (void)resignFirstResponder;

- (void)cancel;

@end