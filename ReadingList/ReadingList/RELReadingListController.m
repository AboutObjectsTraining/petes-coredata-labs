//
//  RELReadingListController.m
//  ReadingList
//
//  Created by Pete Victoratos on 3/13/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import "RELReadingListController.h"
#import "RELSampleBook.h"
#import "RELViewBookController.h"
#import "RELEditBookController.h"

@interface RELReadingListController()
@property (strong, nonatomic) NSMutableArray *sampleBooks;
@property (strong, nonatomic) RELViewBookController *viewBookPage;
@end

@implementation RELReadingListController

//view did load
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBooks];
}

//create sample books array, lazily
- (NSMutableArray *)sampleBooks {
    if (_sampleBooks == nil) {
        _sampleBooks = [NSMutableArray array];
    }
    return _sampleBooks;
}

//load the books
- (void)loadBooks {
    [self.sampleBooks addObjectsFromArray:@[[[RELSampleBook alloc] initWithTitle:@"Harry Potter & the Sorcerers Stone" authorName:@"JK Rowling" bookYear:[NSNumber numberWithInt:1998]],
                                            [[RELSampleBook alloc] initWithTitle:@"Harry Potter & the Chamber of Secrets" authorName:@"JK Rowling" bookYear:[NSNumber numberWithInt:1994]],
                                            [[RELSampleBook alloc] initWithTitle:@"Harry Potter & the Prisoner of Azkaban" authorName:@"JK Rowling" bookYear:[NSNumber numberWithInt:2004]],
                                            ]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.sampleBooks count];
}

//populate the cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:(indexPath.row % 2 == 0) ? @"Even" : @"Odd"];
    RELSampleBook *sampleBook = self.sampleBooks[indexPath.row];
    cell.textLabel.text = sampleBook.bookTitle;
    cell.detailTextLabel.text = sampleBook.authorName;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    RELViewBookController *controller = segue.destinationViewController;
    NSIndexPath *selectedIndexPath = self.tableView.indexPathForSelectedRow;
    controller.book = self.sampleBooks[selectedIndexPath.row];
}

//other action methods
- (IBAction)doneEditingBook:(UIStoryboardSegue *)segue {
    [self.tableView reloadData];
}

- (IBAction)doneAddingBook:(UIStoryboardSegue *)segue {
    [self.tableView reloadData];
    //save to data source
}

- (IBAction)cancelAddingBook:(UIStoryboardSegue *)segue {
}

@end

