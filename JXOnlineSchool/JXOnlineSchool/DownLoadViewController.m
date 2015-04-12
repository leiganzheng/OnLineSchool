//
//  DownLoadViewController.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/3/27.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "DownLoadViewController.h"
#import "Define.h"
#import "DownLoadTableViewCell.h"
#define kCellHeight 88

typedef enum {
    kDownloading = 0,//正在下载
    kDownloaded = 1,//已经下载
} DownloadType;

@interface DownLoadViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *dataArrayDownloaded;
@property (nonatomic, strong) NSArray *dataArrayDetail;
@property (nonatomic,assign) DownloadType type;
@property (weak, nonatomic) IBOutlet UILabel *lineLB;
@property (weak, nonatomic) IBOutlet UIButton *downedButton;
@property (weak, nonatomic) IBOutlet UIButton *downingButton;
@property (weak, nonatomic) IBOutlet UITableView *customTableview;
@end

@implementation DownLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"2015年二级建造师报导入课--为什么学习二级建造师",@"2015年二级建造师报导入课--为什么学习二级建造师"];
     self.dataArrayDownloaded = @[@"2013年二级建造师报导入课--为什么学习二级建造师"];
    self.dataArrayDetail = @[@"0.0M/0.0M",@"0.0M/0.0M"];
    self.type = kDownloading;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UINavigationController *nav  = (UINavigationController *)[[[UIApplication sharedApplication]keyWindow] rootViewController];
    [nav setNavigationBarHidden:NO animated:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    UINavigationController *nav  = (UINavigationController *)[[[UIApplication sharedApplication]keyWindow] rootViewController];
    [nav setNavigationBarHidden:YES animated:animated];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (self.type) {
        case 0:
        {
            return [_dataArray count];
        }
            break;
        case 1:
        {
            return [_dataArrayDownloaded count];
        }
            break;
        default:
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"DownLoad";
    DownLoadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];     if (cell == nil)
    {
        // Use the default cell style.
        cell = [[DownLoadTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
        cell.backgroundColor = kBgColor;
    }
    // Set up the cell.
    cell.lb1.text = _dataArrayDetail[indexPath.row];
    switch (self.type) {
        case 0:
        {
             cell.contentLB.text = _dataArray[indexPath.row];
        }
            break;
        case 1:
        {
             cell.contentLB.text = _dataArrayDownloaded[indexPath.row];
        }
            break;
        default:
            break;
    }

    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - private method
- (IBAction)downLoadingButtonAction:(id)sender {
    UIButton *button = (UIButton *)sender;
     self.downedButton.titleLabel.textColor = kCyColorFromRGB(121, 121, 121);
    self.downingButton.titleLabel.textColor = [UIColor blackColor];
    [UIView animateWithDuration:0.6 animations:^{
        self.lineLB.center = CGPointMake(button.center.x, 42);
    }];
    self.type = kDownloading;
    
    [self.customTableview reloadData];
}
- (IBAction)dowloadedButtonAction:(id)sender {
    UIButton *button = (UIButton *)sender;
    self.downingButton.titleLabel.textColor = kCyColorFromRGB(121, 121, 121);
    self.downedButton.titleLabel.textColor = [UIColor blackColor];
    [UIView animateWithDuration:0.6 animations:^{
        self.lineLB.center = CGPointMake(button.center.x, 42);
    }];
    self.type = kDownloaded;
    [self.customTableview reloadData];
}


@end
