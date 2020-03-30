//
//  RELEditBookController.m
//  ReadingList
//
//  Created by Pete Victoratos on 3/11/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import "RELEditBookController.h"
#import "RELSampleBook.h"

@interface RELEditBookController ()
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *yearField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@end

@implementation RELEditBookController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.titleField.text = self.book.bookTitle;
    self.yearField.text = self.book.bookYear.stringValue;
    self.firstNameField.text = self.book.authorFirstName;
    self.lastNameField.text = self.book.authorLastName;
    self.tableView.rowHeight = 44;
}

- (void)updateBook {
    self.book.bookTitle = self.titleField.text;
    self.book.bookYear = [NSNumber numberWithInt:self.yearField.text.intValue];
    self.book.authorFirstName = self.firstNameField.text;
    self.book.authorLastName = self.lastNameField.text;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Done"]) {
        [self updateBook];
    }
}


@end
