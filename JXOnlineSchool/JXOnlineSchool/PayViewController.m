//
//  PayViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/21.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "PayViewController.h"

@interface PayViewController ()
@property (nonatomic,strong) NSArray *settingWords;
@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.settingWords = @[@[@"商品名称"],@[@"银联手机支付",@"财付通支付",@"支付宝支付",@"微信支付"]];
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _settingWords.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_settingWords[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];     if (cell == nil)
    {
        // Use the default cell style.
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    // Set up the cell.
    cell.textLabel.text = _settingWords[indexPath.section][indexPath.row];
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Action Method

#pragma mark - Private Method


@end
