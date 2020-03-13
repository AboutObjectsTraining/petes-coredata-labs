//
//  RELViewController.m
//  ReadingList
//
//  Created by Pete Victoratos on 3/9/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import "RELViewBookController.h"
#import "RELEditBookController.h"

@interface RELViewBookController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation RELViewBookController


- (IBAction)cancelEditingBook:(UIStoryboardSegue *)segue {
    
}
@end
