//
//  RELViewController.m
//  ReadingList
//
//  Created by Pete Victoratos on 3/9/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import "RELViewBookController.h"
#import "RELEditBookController.h"
#import "RELSampleBook.h"

@interface RELViewBookController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation RELViewBookController

- (void)viewWillAppear:(BOOL)animated
{    
    [super viewWillAppear:animated];
    self.titleLabel.text = self.book.bookTitle;
    self.yearLabel.text = self.book.bookYear.stringValue;
    self.firstNameLabel.text = self.book.authorFirstName;
    self.lastNameLabel.text = self.book.authorLastName;
    self.imageView.image = [UIImage imageNamed:self.book.authorLastName ?: @"anon" ];
}

//goes to edit scene
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UINavigationController *navController = segue.destinationViewController;
    RELEditBookController *controller = navController.childViewControllers.firstObject;
    controller.book = self.book;
    
}

- (IBAction)cancelEditingBook:(UIStoryboardSegue *)segue {
    
}
@end
