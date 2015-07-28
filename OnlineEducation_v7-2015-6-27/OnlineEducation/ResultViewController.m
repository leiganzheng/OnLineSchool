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
    self.dataArray = @[@"交卷得分:",@"作答时间:",@"正确率:"];
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
        cell.selectionStyle =  UITableViewCellSelectionStyleNone;
    }
    // Set up the cell.
    NSInteger index = indexPath.row;
    cell.time.text = self.dataArray[index];
    switch (index) {
        case 0:
            cell.resultTime.text = @"0.0分";
            cell.totalTime.text = @"总分数：100";
            cell.resultTime.textColor = kCyColorFromRGB(227, 73, 61);
            break;
        case 1:
            cell.resultTime.text = @"／分／秒";
            cell.totalTime.text = @"总时间：/";

            break;
        case 2:
        {
            cell.resultTime.text = @"0%";
            cell.totalTime.text = @"总题数：10";
            cell.resultTime.textColor = kCyColorFromRGB(69, 163, 77);
            
            UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(cell.customView.frame.size.width/2-8,cell.customView.frame.size.height-30, 1, 30)];
            lb.backgroundColor = [UIColor lightGrayColor];
            [cell.customView addSubview:lb];
            
            UILabel *lb1 = [[UILabel alloc] initWithFrame:CGRectMake(lb.frame.origin.x+15, cell.totalTime.frame.origin.y, 60, 21)];
            lb1.backgroundColor = [UIColor clearColor];
            lb1.textColor = kGreenColor;
            lb1.font = [UIFont systemFontOfSize:12.0];
            lb1.text = @"答对：0道";
            [cell.customView addSubview:lb1];

        }
            break;
        default:
            break;
    }
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - private method
- (UIView *)buildFooter:(NSArray*)titles andHeight:(int)height withY:(float)y{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, y, self.view.bounds.size.width, 80)];
    header.backgroundColor = [UIColor clearColor];
    for (int i = 0; i< titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i == 0) {
            button.backgroundColor = kCyColorFromRGB(38, 50, 66);
            button.frame = CGRectMake(20,20 , 115, height);
        }else {
            button.backgroundColor = kRedColor;
            button.frame = CGRectMake(self.view.bounds.size.width-115-20,20 , 115, height);
        }
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        [Tools configureView:button isCorner:YES];

        [header addSubview:button];
    }
    return header;
}
- (void)buttonAction{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
