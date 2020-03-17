//
//  OLDReadingListController.m
//  ReadingList
//
//  Created by Pete Victoratos on 3/12/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import "RELReadingListController.h"
#import "RELSampleBook.h"

@interface OLDReadingListController()
@property (strong, nonatomic) NSMutableArray *sampleBooks;
@end

@implementation OLDReadingListController

//calls the load books method in a place that is called once but not often, if ever again
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBooks];
}

//lazily initializes the sampleBooks array
- (NSMutableArray *)sampleBooks {
    if (_sampleBooks == nil){
        //_sampleBooks = [[NSMutableArray alloc] init]; line 28 does the same thing but cleaner
        _sampleBooks = [NSMutableArray array];
    }
    return _sampleBooks;
}

//populate sampleBooks array
- (void)loadBooks {
    [self.sampleBooks addObjectsFromArray:@[[[RELSampleBook alloc] initWithTitle:@"Book About Dudes" authorName:@"Guy Dude" bookYear:[NSNumber numberWithInt:2002]],
                                            [[RELSampleBook alloc] initWithTitle:@"Book About Girls" authorName:@"Gal Girl" bookYear:[NSNumber numberWithInt:1994]],
                                            [[RELSampleBook alloc] initWithTitle:@"Book About Things" authorName:@"Thing" bookYear:[NSNumber numberWithInt:1924]],
                                            ]];
}

//tells how many rows there are, in this case how many books
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.sampleBooks count];
}

//populate cells with Books
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((int)indexPath.row % 2 == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Even"];
        RELSampleBook *sampleBook = self.sampleBooks[indexPath.row];
        cell.textLabel.text = sampleBook.bookTitle;
        cell.detailTextLabel.text = sampleBook.authorName;
        return cell;
    }
    else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Odd"];
        RELSampleBook *sampleBook = self.sampleBooks[indexPath.row];
        cell.textLabel.text = sampleBook.bookTitle;
        cell.detailTextLabel.text = sampleBook.authorName;
        return cell;
    }
}

- (IBAction)doneEditingBook:(UIStoryboardSegue *)segue {
    [self.tableView reloadData];
    //save to data source
}

- (IBAction)doneAddingBook:(UIStoryboardSegue *)segue {
    [self.tableView reloadData];
    //save to data source
}

- (IBAction)cancelAddingBook:(UIStoryboardSegue *)segue {
}

@end
