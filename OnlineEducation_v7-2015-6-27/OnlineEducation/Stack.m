//
//  Stack.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/7/16.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "Stack.h"
@interface Stack ()
@property (nonatomic,strong)NSMutableArray* m_array;
@end
@implementation Stack
- (id)init
{
    if(self=[super init])
    {
        _m_array = [[NSMutableArray alloc] init];
        _count = 0;
    }
    return self;
}

- (void)push:(id)anObject
{
    [_m_array addObject:anObject];
    _count = _m_array.count;
}
- (id)pop
{
    id obj = nil;
    if(_m_array.count > 0)
    {
        obj = [_m_array lastObject];
        [_m_array removeLastObject];
        _count = _m_array.count;
    }
    return obj;
}
- (void)clear
{
    [_m_array removeAllObjects];
    _count = 0;
}
@end
