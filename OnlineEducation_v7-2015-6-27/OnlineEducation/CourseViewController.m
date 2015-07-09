//
//  CourseViewController.m
//  OnlineEducation
//
//  Created by leiganzheng on 15/3/27.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//

#import "CourseViewController.h"
#import "CourseCollectionViewCell.h"
#import "CourseOneCollectionViewCell.h"
@interface CourseViewController ()

@end

@implementation CourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UICollectionViewDataSource,UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 6;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            static NSString * CellIdentifier = @"GradientCell";
            CourseCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
            cell.customView.backgroundColor = kCyColorFromRGB(247, 77, 77);
            cell.customView.layer.cornerRadius = 10.0;
            cell.customView.layer.masksToBounds = YES;
            
            cell.startButton.layer.borderWidth = 1.0f;
            cell.startButton.layer.borderColor = kCyColorFromRGB(203, 203, 203).CGColor;
            cell.startButton.layer.masksToBounds = YES;
            cell.startButton.layer.cornerRadius = 3.0f;

            return cell;
        }
            break;
        case 1:
        {
            static NSString * CellIdentifier = @"GradientCellOne";
            CourseOneCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
            cell.customView.backgroundColor = kCyColorFromRGB(132, 120, 104);
            cell.customView.layer.cornerRadius = 10.0;
            cell.customView.layer.masksToBounds = YES;
            
            cell.startButton.layer.borderWidth = 1.0f;
            cell.startButton.layer.borderColor = kCyColorFromRGB(203, 203, 203).CGColor;
            cell.startButton.layer.masksToBounds = YES;
            cell.startButton.layer.cornerRadius = 3.0f;
            
            cell.buyButton.layer.borderWidth = 1.0f;
            cell.buyButton.layer.borderColor = kCyColorFromRGB(203, 203, 203).CGColor;
            cell.buyButton.layer.masksToBounds = YES;
            cell.buyButton.layer.cornerRadius = 3.0f;
            return cell;
        }
            break;
        case 2:
        {
            static NSString * CellIdentifier = @"GradientCellOne";
            CourseOneCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
            cell.customView.backgroundColor = kCyColorFromRGB(104, 132, 143);
            cell.customView.layer.cornerRadius = 10.0;
            cell.customView.layer.masksToBounds = YES;
            cell.startButton.layer.borderWidth = 1.0f;
            cell.startButton.layer.borderColor = kCyColorFromRGB(203, 203, 203).CGColor;
            cell.startButton.layer.masksToBounds = YES;
            cell.startButton.layer.cornerRadius = 3.0f;
            
            cell.buyButton.layer.borderWidth = 1.0f;
            cell.buyButton.layer.borderColor = kCyColorFromRGB(203, 203, 203).CGColor;
            cell.buyButton.layer.masksToBounds = YES;
            cell.buyButton.layer.cornerRadius = 3.0f;
            return cell;
        }
            break;
        case 3:
        {
            static NSString * CellIdentifier = @"GradientCellOne";
            CourseOneCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
            cell.customView.backgroundColor = kCyColorFromRGB(132, 120, 104);
            cell.customView.layer.cornerRadius = 10.0;
            cell.customView.layer.masksToBounds = YES;
            cell.startButton.layer.borderWidth = 1.0f;
            cell.startButton.layer.borderColor = kCyColorFromRGB(203, 203, 203).CGColor;
            cell.startButton.layer.masksToBounds = YES;
            cell.startButton.layer.cornerRadius = 3.0f;
            
            cell.buyButton.layer.borderWidth = 1.0f;
            cell.buyButton.layer.borderColor = kCyColorFromRGB(203, 203, 203).CGColor;
            cell.buyButton.layer.masksToBounds = YES;
            cell.buyButton.layer.cornerRadius = 3.0f;
            return cell;
        }
            break;
        case 4:
        {
            static NSString * CellIdentifier = @"GradientCellOne";
            CourseOneCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
            cell.customView.backgroundColor = kCyColorFromRGB(144, 113, 128);
            cell.customView.layer.cornerRadius = 10.0;
            cell.customView.layer.masksToBounds = YES;
            cell.startButton.layer.borderWidth = 1.0f;
            cell.startButton.layer.borderColor = kCyColorFromRGB(203, 203, 203).CGColor;
            cell.startButton.layer.masksToBounds = YES;
            cell.startButton.layer.cornerRadius = 3.0f;
            
            cell.buyButton.layer.borderWidth = 1.0f;
            cell.buyButton.layer.borderColor = kCyColorFromRGB(203, 203, 203).CGColor;
            cell.buyButton.layer.masksToBounds = YES;
            cell.buyButton.layer.cornerRadius = 3.0f;
            return cell;
        }
            break;
        case 5:
        {
            static NSString * CellIdentifier = @"GradientCell";
            CourseCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
            cell.customView.backgroundColor = kCyColorFromRGB(59, 59, 59);
            cell.customView.layer.cornerRadius = 10.0;
            cell.customView.layer.masksToBounds = YES;
            cell.contentLB.center = cell.customView.center;
            cell.contentLB.text = @"暂无信息";
            if (kScreenHeight == 667) {
                cell.topConstraint.constant = 40;
            }else if(kScreenHeight == 736){
                cell.topConstraint.constant = 50;
            }else{
                cell.topConstraint.constant = 40;
            }
            
            cell.startButton.hidden  = YES;
            return cell;
        }
            break;
        default:
            return nil;
            break;
    }

}
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (kScreenHeight == 568) {
        return CGSizeMake(140, 95);
    }else if (kScreenHeight == 667){
        return CGSizeMake(167, 110);
    }
    else if (kScreenHeight == 736){
        return CGSizeMake(187, 120);
    }else{
        return CGSizeMake(140, 95);
    }
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 5, 10);
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
