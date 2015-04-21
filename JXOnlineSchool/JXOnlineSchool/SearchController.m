//
//  QNSearchController.m
//  QooccNews
//
//  Created by GuJinyou on 14-7-22.
//  Copyright (c) 2014年 巨细科技. All rights reserved.
//

#import "SearchController.h"

@interface SearchController () <UISearchBarDelegate, UISearchDisplayDelegate, UISearchControllerDelegate,
UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UISearchDisplayController *searchDisplayController;
@property (nonatomic, assign) UIEdgeInsets      contentInsets;
@property (nonatomic, retain) id selfRetain;

@end


@implementation SearchController 

- (instancetype)initWithContentsController:(UIViewController *)viewController searchBarFrame:(CGRect)frame selected:(void (^)(id))selectedBlock cancel:(void (^)())cancelBlock {
    self = [super init];
    if (self) {
        self.selfRetain = self;
        self.selectedBlock = selectedBlock;
        self.cancelBlock = cancelBlock;
        
        UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:frame];
        searchBar.showsCancelButton = YES;
        searchBar.backgroundColor = [UIColor lightGrayColor];
        searchBar.delegate = self;
        [viewController.view addSubview:searchBar];
        self.searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:viewController];
        
        self.searchDisplayController.delegate = self;
        self.searchDisplayController.searchResultsDataSource = self;
        self.searchDisplayController.searchResultsDelegate = self;
        self.searchDisplayController.searchResultsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.contentInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        self.searchDisplayController.searchResultsTableView.contentInset = self.contentInsets;
    }
    return self;
}

- (void)becomeFirstResponder {
    [self.searchDisplayController.searchBar becomeFirstResponder];
}

- (void)resignFirstResponder {
    [self.searchDisplayController.searchBar resignFirstResponder];
}

- (void)cancel {
    [self.searchDisplayController.searchBar resignFirstResponder];
    [self.searchDisplayController.searchBar removeFromSuperview];
    
    // 需要延迟0.5秒～ 等动画完成，然后cancel；
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.cancelBlock != nil) {
            self.cancelBlock();
            self.cancelBlock = nil;
        }
        self.selfRetain = nil;
    });
}

#pragma mark - UISearchDisplayControllerDelegate
- (void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller {
    
}

- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller {
    [self searchBarCancelButtonClicked:self.searchDisplayController.searchBar];
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    controller.searchResultsTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self removeNoResultsView:controller];
    return YES;
}

- (void)removeNoResultsView:(UISearchDisplayController *)controller {
   
}

#pragma mark - UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar {
    [self cancel];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

        return 78;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        return nil;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
 }
@end
