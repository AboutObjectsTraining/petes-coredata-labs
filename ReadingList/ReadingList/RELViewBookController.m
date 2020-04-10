//
//  RELViewController.m
//  ReadingList
//
//  Created by Pete Victoratos on 3/9/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import "RELViewBookController.h"
#import "RELEditBookController.h"
#import <ReadingListModel/ReadingListModel.h>

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
    self.titleLabel.text = self.book.title;
    self.yearLabel.text = self.book.year;
    self.firstNameLabel.text = self.book.author.firstName;
    self.lastNameLabel.text = self.book.author.lastName;
    
    UIImage *image = [UIImage imageNamed:self.book.author.lastName];
    self.imageView.image = image != nil ? image: [UIImage imageNamed:@"anon"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UINavigationController *navController = segue.destinationViewController;
    RELEditBookController *controller = navController.childViewControllers.firstObject;
    controller.book = self.book;
    
}

// MARK: Unwind segues
- (IBAction)cancelEditingBook:(UIStoryboardSegue *)segue {
    
}
@end
