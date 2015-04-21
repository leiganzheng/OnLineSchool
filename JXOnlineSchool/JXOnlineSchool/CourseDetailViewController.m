//
//  CourseDetailViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/11.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "CourseDetailViewController.h"
#import "CommentTableViewCell.h"
#import "UIResponder+StoryBoard.h"
#import "PayViewController.h"

typedef enum {
    comment = 0,
    directory = 1,
} kVCtype;


@interface CourseDetailViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *commentDataArray;
@property (nonatomic,assign) kVCtype type;
@property (weak, nonatomic) IBOutlet UITableView *customTableView;

@end

@implementation CourseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"2015年山东二级建造师报名入口",@"2015年甘肃二级建造师报名入口",@"2015年云南二级建造师考试资格审查报名入口",@"2015年北京二级建造师报名入口"];
    self.commentDataArray =  @[@"2015年山东二级建造师报名入口",@"2015年甘肃二级建造师报名入口",@"2015年云南二级建造师考试资格审查报名入口",@"2015年北京二级建造师报名入口"];
    self.type = directory;
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
        case comment:
        {
            return [_commentDataArray count];
        }
            break;
        case directory:
        {
           return  [_dataArray count];
        }
            break;
            
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.type == comment) {
        static NSString *MyIdentifier = @"Information";
        CommentTableViewCell *cell = (CommentTableViewCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if (cell == nil)
        {
            // Use the default cell style.
            cell = (CommentTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"CommentTableViewCell" owner:self options:nil] objectAtIndex:0];
        }
        return cell;
    }else if(self.type == directory){
        static NSString *MyIdentifier = @"courseDetailCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if (cell == nil)
        {
            // Use the default cell style.
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        }
        return cell;
    }
    return nil;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (self.type) {
        case comment:
        {
            return 90;
        }
            break;
        case directory:
        {
            return 50;
        }
            break;

        default:
            return 0;
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
 
}

#pragma mark - Action Method
- (IBAction)courseButtonAction:(id)sender {
    self.type = directory;
    [self.customTableView reloadData];

}
- (IBAction)commentButtonAction:(id)sender {
    self.type = comment;
    [self.customTableView reloadData];
}
- (IBAction)signUp:(id)sender {
    [self.navigationController pushViewController:[PayViewController CreateFromMainStoryboard] animated:YES];
}
#pragma mark - Private Method


@end
