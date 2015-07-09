//
//  CourseOneCollectionViewCell.h
//  OnlineEducation
//
//  Created by leiganzheng on 15/4/2.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseOneCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *customView;
@property (weak, nonatomic) IBOutlet UIButton *buyButton;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;

@end
