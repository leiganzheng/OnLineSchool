//
//  CourseViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/11.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "CourseViewController.h"
#import "CourseTableViewCell.h"
typedef enum {
    kConstruction = 0,
    kFinance = 1,
    kEducation = 2,
} kCourseType;

@interface CourseViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lineLabel;
@property (nonatomic,assign) kCourseType type;
@property (nonatomic, strong) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UITableView *customTableView;
@end

@implementation CourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"2015年山东二级建造师报名入口",@"2015年甘肃二级建造师报名入口",@"2015年云南二级建造师考试资格审查报名入口",@"2015年北京二级建造师报名入口"];
    self.type = kConstruction;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"Information";
    CourseTableViewCell *cell = (CourseTableViewCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil)
    {
        // Use the default cell style.
        cell = (CourseTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"CourseTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - Action Method
- (IBAction)constructionButtonAction:(id)sender {
    UIButton *temp = (UIButton *)sender;
    [UIView animateWithDuration:0.5 animations:^{
        self.lineLabel.center = CGPointMake(temp.center.x, self.lineLabel.center.y);
    }];
    self.type = kConstruction;
    [self.customTableView reloadData];
}
- (IBAction)financeButtonAction:(id)sender {
    UIButton *temp = (UIButton *)sender;
    [UIView animateWithDuration:0.5 animations:^{
        self.lineLabel.center = CGPointMake(temp.center.x, self.lineLabel.center.y);
    }];
    self.type = kFinance;
    [self.customTableView reloadData];
}
- (IBAction)educationButtonAction:(id)sender {
    UIButton *temp = (UIButton *)sender;
    [UIView animateWithDuration:0.5 animations:^{
        self.lineLabel.center = CGPointMake(temp.center.x, self.lineLabel.center.y);
    }];
    self.type = kEducation;
    [self.customTableView reloadData];
}
#pragma mark - Private Method


@end
