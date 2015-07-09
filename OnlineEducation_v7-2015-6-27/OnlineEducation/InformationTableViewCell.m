//
//  InformationTableViewCell.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/4/2.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "InformationTableViewCell.h"

@implementation InformationTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.customView.layer.borderWidth = 1.0f;
    self.customView.layer.borderColor = kCyColorFromRGB(203, 203, 203).CGColor;
    self.button.layer.masksToBounds = YES;
    self.button.layer.cornerRadius = 10;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCellWithString:(NSString *)string flag:(BOOL)flag {
    UIFont *font = self.contentLB.font;
    CGSize maxSize = CGSizeMake(217, MAXFLOAT);
    CGSize size = [string sizeWithFont:font
                   constrainedToSize:maxSize
                       lineBreakMode:NSLineBreakByWordWrapping];
    CGFloat y = size.height > 35 ? 10 : self.contentLB.frame.origin.y;
    CGRect rect = CGRectMake(self.contentLB.frame.origin.x,y, 217,size.height);
    self.contentLB.frame = rect;
    self.contentLB.text = string;
    
    self.result.hidden = flag;
    self.total.hidden = !flag;
    self.button.backgroundColor = flag ? kCyColorFromRGB(227,73,63) : kCyColorFromRGB(67,163,76);

}

@end
