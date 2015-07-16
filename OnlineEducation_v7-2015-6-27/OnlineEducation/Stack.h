//
//  Stack.h
//  OnlineEducation
//
//  Created by leiganzheng on 15/7/16.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject
@property (nonatomic, readonly) NSInteger count;
- (void)push:(id)anObject;
- (id)pop;
- (void)clear;
@end
