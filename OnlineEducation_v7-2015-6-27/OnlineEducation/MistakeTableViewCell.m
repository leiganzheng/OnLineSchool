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
    [Tools configureView:self.customView isCorner:NO];
    [Tools configureView:@[self.button1,self.button2] isCorner:YES];
    self.progressView.transform = CGAffineTransformMakeScale(1.0f,3.0f);
    self.progressView.layer.masksToBounds = YES;
    self.progressView.layer.cornerRadius = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)updateCellWithString:(NSString *)string{

}
@end
