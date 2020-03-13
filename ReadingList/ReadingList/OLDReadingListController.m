//
//  RELReadingListController.m
//  ReadingList
//
//  Created by Pete Victoratos on 3/9/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import "RELReadingListController.h"
#import "RELSampleBook.h"

@interface OLDReadingListController()
@property (strong, nonatomic) NSMutableArray *sampleBooks;
@end

@implementation OLDReadingListController

- (NSMutableArray *)sampleBooks {
    if (_sampleBooks == nil){
        _sampleBooks = [NSMutableArray array];
    }
    return _sampleBooks;
}

- (void)loadBooks {
    
    [self.sampleBooks addObjectsFromArray:@[[[RELSampleBook alloc] initWithTitle:@"Put Me in the Zoo" authorName:@"Robert Lopshire"],
                                            [[RELSampleBook alloc] initWithTitle:@"The Rainbow Fish" authorName:@"Marcus Pfister"],
                                            [[RELSampleBook alloc] initWithTitle:@"The Giving Tree" authorName:@"Shel Silverstein"],
                                            ]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBooks];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.sampleBooks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Odd"];
    
    RELSampleBook *sampleBook = self.sampleBooks[indexPath.row];
    cell.textLabel.text = sampleBook.bookTitle;
    cell.detailTextLabel.text = sampleBook.authorName;
    return cell;
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
