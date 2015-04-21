//
//  MainBaseViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/21.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "MainBaseViewController.h"
#import "SearchController.h"
@interface MainBaseViewController ()
@property (nonatomic,strong) SearchController *searchController;
@end

@implementation MainBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(0, 0 ,40, 40);
    searchBtn.backgroundColor = [UIColor orangeColor];
    [searchBtn addTarget:self action:@selector(searchButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [searchBtn setImage: [UIImage imageNamed: @"common"] forState: UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

#pragma mark - Action Method

#pragma mark - Private Method
- (void)searchButtonAction {
     _searchController = [[SearchController alloc] initWithContentsController:self searchBarFrame:CGRectMake(0, 20, self.view.bounds.size.width, 44) selected:^(id data) {
        
    } cancel:nil];
    [_searchController becomeFirstResponder];

}
@end
