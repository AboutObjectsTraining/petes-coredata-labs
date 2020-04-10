//
//  RELReadingListController.m
//  ReadingList
//
//  Created by Pete Victoratos on 3/13/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import "RELReadingListController.h"
#import "RELViewBookController.h"
#import "RELAddBookController.h"
#import "RELEditBookController.h"
#import "UIStoryboardSegue+RELAdditions.h"
#import "ReadingListModel.h"

@class RLMStoreController;

@interface RELReadingListController ()
@property (strong, nonatomic) RLMReadingList *readingList;
@property (strong, nonatomic) IBOutlet RLMStoreController *storeController;
@end

@implementation RELReadingListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.window.tintColor = [UIColor colorNamed:@"Tint Color"];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//create reading list, lazily
- (RLMReadingList *)readingList {
    if (_readingList == nil) {
        _readingList = self.storeController.fetchedReadingList;
    }
    return _readingList;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"View Book"]) {
        RELViewBookController *controller = segue.rel_destinationViewController;
        RLMBook *selectedBook = [self.readingList bookAtIndexPath:self.tableView.indexPathForSelectedRow];
        controller.book = selectedBook;
    } else if ([segue.identifier isEqualToString:@"Add Book"]) {
        RELAddBookController *controller = segue.rel_destinationViewController;
        //what's this?
        controller.completion = ^(RLMBook *book) {
            [self.readingList insertBook:book atIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        };
    } else {
        NSLog(@"Unexpected segue with identifier: %@", segue.identifier);
        //what's this do?
        abort();
    }
}

//MARK: - Unwind Segues
- (IBAction)done:(UIStoryboardSegue *)segue {
    [self.tableView reloadData];
    [self.storeController saveReadingList:self.readingList];
    
}

- (IBAction)cancel:(UIStoryboardSegue *)segue {
}

//MARK: - UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:(indexPath.row % 2 == 0) ? @"Even" : @"Odd"];
    RLMBook *book = [self.readingList bookAtIndexPath:indexPath];
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@", book.year, book.author.fullName];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    [self.readingList removeBookAtIndexPath:indexPath];
    [self.storeController saveReadingList:self.readingList];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    [self.readingList moveBookAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
    [self.storeController saveReadingList:self.readingList];
}


@end

