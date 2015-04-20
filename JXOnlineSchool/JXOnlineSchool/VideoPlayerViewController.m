//
//  VedioPlayerViewController.m
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/15.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "VideoPlayerViewController.h"
#import "CommentTableViewCell.h"
#import "CourseTableViewCell.h"

typedef enum {
    comment = 0,
    directory = 1,
    releted = 2,
} kVCtype;


@interface VideoPlayerViewController ()
@property (nonatomic,assign) kVCtype type;
@property (weak, nonatomic) IBOutlet UITableView *customTableView;
@end
@implementation VideoPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.type = directory;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.type == directory) {
        return 60;
    }else{
        return 0;
    }

}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"建设工程法规";
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
        
        static NSString *MyIdentifier = @"VideoCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if (cell == nil)
        {
            // Use the default cell style.
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
        }
        return cell;
    }else if (self.type == releted){
        static NSString *MyIdentifier = @"Information";
        CourseTableViewCell *cell = (CourseTableViewCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if (cell == nil)
        {
            // Use the default cell style.
            cell = (CourseTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"CourseTableViewCell" owner:self options:nil] objectAtIndex:0];
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
            return  60;
        }
            break;
        case releted:
        {
            return  80;
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

//MARK:- Action Method
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)offlineAction:(id)sender {
}
- (IBAction)shareAction:(id)sender {
}
- (IBAction)dictoryButtonAction:(id)sender {
    self.type = directory;
    [self.customTableView reloadData];
}
- (IBAction)commentButtonAction:(id)sender {
    self.type = comment;
    [self.customTableView reloadData];
}
- (IBAction)relatedButtonAction:(id)sender {
    self.type = releted;
    [self.customTableView reloadData];
}

//MARK:- Private Method



@end
