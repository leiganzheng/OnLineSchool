//
//  StartViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/15.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

@property (strong, nonatomic) UIScrollView *pictureScrollView;
@property (strong, nonatomic) UIPageControl *pageContrlolerView;

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray  *pictureArray = @[@"start",@"start1",@"start2"];
    
    self.pictureScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.pictureScrollView.bounces = NO;
    self.pictureScrollView.pagingEnabled = YES;
    self.pictureScrollView.showsVerticalScrollIndicator =  NO;
    self.pictureScrollView.showsHorizontalScrollIndicator = NO;
    self.pictureScrollView.userInteractionEnabled = YES;
    [self.view addSubview:self.pictureScrollView];
    self.pictureScrollView.backgroundColor = [UIColor whiteColor];
    self.pictureScrollView.contentSize = CGSizeMake(self.view.bounds.size.width * pictureArray.count, 0);
    
    
    for (int i = 1; i<=pictureArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width *(i-1), 0, self.view.frame.size.width, self.view.frame.size.height)];
        imageView.backgroundColor = [UIColor orangeColor];
        imageView.image = [UIImage imageNamed:pictureArray[i-1]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        if (i == 3) {
            UIButton *enterButton = [UIButton buttonWithType:UIButtonTypeCustom];
            enterButton.frame = CGRectMake(self.view.bounds.size.width/2 - 100, self.view.bounds.size.height - 80, 200, 60);
            enterButton.backgroundColor = [UIColor clearColor];
            [enterButton addTarget:self action:@selector(enterButtonAction) forControlEvents:UIControlEventTouchUpInside];
            imageView.userInteractionEnabled = YES;
            [imageView addSubview:enterButton];
        }
        [self.pictureScrollView addSubview:imageView];
    }
    
    //UIPageControl
    self.pageContrlolerView = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 40)];
    self.pageContrlolerView.numberOfPages = pictureArray.count;
    self.pageContrlolerView.currentPage = 0;
    self.pageContrlolerView.pageIndicatorTintColor = [UIColor grayColor];
    [self.view addSubview:self.pageContrlolerView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//MARK:- Delegate or DataSource

//MARK:- NSNotification Method

//MARK:- Action Method
- (void)enterButtonAction{
    self.finish();
}
//MARK:- Private Method


@end
