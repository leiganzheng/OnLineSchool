//
//  ResultTableViewCell.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/7/11.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "ResultTableViewCell.h"

@implementation ResultTableViewCell

- (void)awakeFromNib {
    self.customView.layer.borderWidth = 0.5;
    self.customView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.customView.layer.masksToBounds = YES;
    self.customView.layer.cornerRadius = 5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
