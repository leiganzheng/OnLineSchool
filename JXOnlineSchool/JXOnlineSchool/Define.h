//
//  Define.h
//  OnlineEducation
//
//  Created by leiganzheng on 15/3/27.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#ifndef JXOnlineSchool_Define_h
#define JXOnlineSchool_Define_h

//系统版本
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
//App版本号
#define APP_VERSION  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//App编译版本号
#define APP_VERSION_BUILD   [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]

// screen size
#define kScreenHeight ([[UIScreen mainScreen] bounds].size.height)
#define kScreenWidth ([[UIScreen mainScreen] bounds].size.width)
// 颜色值(RGB)
#define kCyColorFromRGBA(r, g, b, a) [UIColor colorWithRed:((r) / 255.0f) green:((g) / 255.0f) blue:((b) / 255.0f) alpha:(a)]
#define kCyColorFromRGB(r, g, b) [UIColor colorWithRed:((r) / 255.0f) green:((g) / 255.0f) blue:((b) / 255.0f) alpha:(1.0f)]
// 背景颜色
#define kBgColor   [UIColor colorWithRed:(242 / 255.0f) green:(242 / 255.0f) blue:(242 / 255.0f) alpha:1.0f]

#endif
