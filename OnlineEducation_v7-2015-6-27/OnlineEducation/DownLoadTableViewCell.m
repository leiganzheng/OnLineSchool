//
//  DownLoadTableViewCell.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/4/2.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "DownLoadTableViewCell.h"

@implementation DownLoadTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.customView.layer.masksToBounds = YES;
    self.customView.layer.cornerRadius = 3.0f;
    self.customView.layer.borderWidth = 1.0f;
    self.customView.layer.borderColor = kCyColorFromRGB(203, 203, 203).CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
