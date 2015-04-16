//
//  StartViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/15.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

@property (weak, nonatomic) IBOutlet UIPageControl *customPageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *customScrollView;
@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray  *pictureArray = @[@"start",@"start1",@"start2"];
    
    CGRect scrollViewRect = [self.view bounds];
    _customScrollView.contentSize = CGSizeMake(scrollViewRect.size.width * pictureArray.count,1);
    _customScrollView.showsHorizontalScrollIndicator = NO;
    _customScrollView.showsVerticalScrollIndicator = NO;
    _customScrollView.delegate = self;
    
    _customPageControl.backgroundColor = [UIColor clearColor];
    _customPageControl.numberOfPages = pictureArray.count;
    _customPageControl.currentPage = 0;
    
    for (int i = 1; i<=pictureArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width *(i-1), 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        imageView.backgroundColor = [UIColor clearColor];
        imageView.image = [UIImage imageNamed:pictureArray[i-1]];
        if (i == 3) {
            UIButton *enterButton = [UIButton buttonWithType:UIButtonTypeCustom];
            enterButton.frame = CGRectMake(self.view.bounds.size.width/2 - 100, self.view.bounds.size.height - 64, 200, 44);
            enterButton.backgroundColor = [UIColor clearColor];            
            [enterButton addTarget:self action:@selector(enterButtonAction) forControlEvents:UIControlEventTouchUpInside];
            imageView.userInteractionEnabled = YES;
            [imageView addSubview:enterButton];
        }
        [self.customScrollView addSubview:imageView];
    }
   
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
