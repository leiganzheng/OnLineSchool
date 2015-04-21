//
//  SearchController.h
//  JXOnlineSchool
//
//  Created by leiganzheng on 15/4/15.
//  Copyright (c) 2015年 leiganzheng. All rights reserved.
//
#import "SearchController.h"

@interface SearchController () <UISearchBarDelegate, UISearchDisplayDelegate, UISearchControllerDelegate,
UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UISearchDisplayController *searchDisplayController;
@property (nonatomic, assign) UIEdgeInsets  contentInsets;
@end


@implementation SearchController 

- (instancetype)initWithContentsController:(UIViewController *)viewController searchBarFrame:(CGRect)frame selected:(void (^)(id))selectedBlock cancel:(void (^)())cancelBlock {
    self = [super init];
    if (self) {
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
}

#pragma mark - UISearchDisplayControllerDelegate
- (void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller {
    
}

- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller {
    [self searchBarCancelButtonClicked:self.searchDisplayController.searchBar];
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    controller.searchResultsTableView.separatorStyle = UITableViewCellSelectionStyleNone;
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
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell ==  nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
 }
@end
