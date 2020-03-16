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
    NSArray *authorName = [self.book returnAuthorName:self.book.authorName];
    
    [super viewWillAppear:animated];
    self.titleLabel.text = self.book.bookTitle;
    self.firstNameLabel.text = authorName[0];
    self.lastNameLabel.text = authorName[1];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UINavigationController *navController = segue.destinationViewController;
    RELEditBookController *controller = navController.childViewControllers.firstObject;
    
    controller.book = self.book;
}

- (IBAction)cancelEditingBook:(UIStoryboardSegue *)segue {
    
}
@end
