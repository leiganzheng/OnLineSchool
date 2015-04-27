//
//  CustomShareViewController.h
//
//
//  Created by leiganzheng on 14/11/24.
//  Copyright (c) 2014年  All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    ShareTypeSinaWeibo = 1,         /**< 新浪微博 */
    ShareTypeTencentWeibo = 2,      /**< 腾讯微博 */
    ShareTypeQQSpace = 3,           /**< QQ空间 */
    ShareTypeLinkedIn = 4,         /**< LinkedIn */
    ShareTypeMail = 5,             /**< 邮件分享 */
    ShareTypeSMS = 6,              /**< 短信分享 */
    ShareTypeWeixiSession = 7,     /**< 微信好友 */
    ShareTypeWeixiTimeline = 8,    /**< 微信朋友圈 */
    ShareTypeQQ = 9,               /**< QQ */
    ShareTypeAny = 99               /**< 任意平台 */
}
ShareType;


typedef void(^FinishBlock)(ShareType type);

@interface CustomShareViewController : UIViewController <UIGestureRecognizerDelegate>
@property (nonatomic,copy) FinishBlock block;
- (id)initWithBlock:(FinishBlock)finish;
@end
