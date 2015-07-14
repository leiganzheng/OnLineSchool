//
//  MistakeTableViewCell.h
//  OnlineEducation
//
//  Created by leiganzheng on 15/7/9.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MistakeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *wrong;
@property (weak, nonatomic) IBOutlet UILabel *hasDone;
@property (weak, nonatomic) IBOutlet UILabel *done;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UILabel *per;
@property (weak, nonatomic) IBOutlet UIView *customView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (weak, nonatomic) IBOutlet UILabel *title;
- (void)updateCellWithString:(NSString *)string;
@end
