//
//  CourseCollectionViewCell.h
//  OnlineEducation
//
//  Created by leiganzheng on 15/4/2.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *customView;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UILabel *contentLB;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;

@end
