//
//  RELReadingListDataSource.m
//  ReadingList
//
//  Created by Peter Victoratos on 3/30/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RELReadingListDataSource.h"

@import ReadingListModel;

@interface RELReadingListDataSource () <UITableViewDataSource>
@property (strong, nonatomic) IBOutlet RLMStoreController *storeController;
@property (strong, nonatomic) RLMReadingList *readingList;
@end

@implementation RELReadingListDataSource

- (RLMReadingList *)readingList {
    if (_readingList == nil) {
        _readingList = self.storeController.fetchedReadingList;
    }
    return _readingList;
}

- (RLMBook *)bookAtIndexPath:(NSIndexPath *)indexPath {
    return [self.readingList bookAtIndexPath:indexPath];
}

- (void)addBook:(RLMBook *)book {
    [self.readingList insertBook:book
                     atIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
}

- (void)save {
    [self.storeController saveReadingList:self.readingList];
}

// MARK: - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.readingList.books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = indexPath.row % 2 == 0 ? @"Even" : @"Odd";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    [self populateCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)populateCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    RLMBook *book = [self.readingList bookAtIndexPath:indexPath];
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ | %@", book.year, book.author.fullName];
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.readingList moveBookAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
    [self save];
    
    [tableView reloadData];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.readingList removeBookAtIndexPath:indexPath];
    [self save];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}
@end
