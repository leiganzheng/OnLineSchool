//
//  MistakeTableViewCell.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/7/9.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "MistakeTableViewCell.h"
@implementation MistakeTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.customView.layer.borderWidth = 1.0f;
    self.customView.layer.borderColor = kCyColorFromRGB(203, 203, 203).CGColor;
    self.button1.layer.masksToBounds = YES;
    self.button1.layer.cornerRadius = 8;
    self.button2.layer.masksToBounds = YES;
    self.button2.layer.cornerRadius = 8;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)updateCellWithString:(NSString *)string{

}
@end
