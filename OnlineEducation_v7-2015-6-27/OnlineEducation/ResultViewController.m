//
//  ResultViewController.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/7/11.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "ResultViewController.h"
#import "ResultTableViewCell.h"

@interface ResultViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myTableview;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"交卷得分",@"作答时间",@"正确率"];
    int footer = 35;
    NSArray *footers = @[@"重新做题",@"查看解析"];
    self.myTableview.tableFooterView = [self buildFooter:footers andHeight:footer withY:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"result";
    ResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil)
    {
        // Use the default cell style.
        cell = [[ResultTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    // Set up the cell.
    NSInteger index = indexPath.row;
    cell.time.text = self.dataArray[index];
    switch (index) {
        case 0:
            cell.time.text = @"0.0分";
            cell.totalTime.text = @"总分数";
            break;
        case 1:
            cell.time.text = @"／分／秒";
            cell.totalTime.text = @"总时间";

            break;
        case 2:
            cell.time.text = @"0％";
            cell.totalTime.text = @"总分题数";

            break;
            
        default:
            break;
    }
    cell.time.text = self.dataArray[indexPath.row];
    cell.time.text = self.dataArray[indexPath.row];
    cell.time.text = self.dataArray[indexPath.row];
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - private method
- (UIView *)buildFooter:(NSArray*)titles andHeight:(int)height withY:(float)y{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, y, self.view.bounds.size.width, 80)];
    header.backgroundColor = [UIColor clearColor];
    for (int i = 0; i< titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i == 0) {
            button.backgroundColor = kCyColorFromRGB(38, 50, 66);
            button.frame = CGRectMake(20,0 , 115, height);
        }else {
            button.backgroundColor = kCyColorFromRGB(227, 73, 61);
            button.frame = CGRectMake(self.view.bounds.size.width-115-20,0 , 115, height);
        }
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        button.layer.borderWidth = 0.5;
        button.layer.borderColor = [kCyColorFromRGB(211, 211, 211) CGColor];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 5;
        [header addSubview:button];
    }
    return header;
}

@end
