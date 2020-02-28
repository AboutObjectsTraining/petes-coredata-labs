//
//  NCVViewController.m
//  newCoolness
//
//  Created by Peter Victoratos on 2/24/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import "NCVViewController.h"
#import "NCVCoolViewCell.h"

@interface NCVViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutletCollection(NSMutableArray) NSMutableArray *cells;
@property (strong, nonatomic) IBOutlet UITextField *textField;

@end

@implementation NCVViewController

- (NSMutableArray *)cells {
    if (_cells == nil) {
        _cells = [[NSMutableArray alloc] init];
    }
    return _cells;
}

- (IBAction)addCell{
    NCVCoolViewCell *cell = [[NCVCoolViewCell alloc] init];
    cell.backgroundColor = UIColor.systemPinkColor;
    cell.clipsToBounds = YES;
    cell.text = self.textField.text;
    [self.contentView addSubview:cell];
    [self.cells addObject:cell];
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)endAnimations {
    for (NCVCoolViewCell *cell in self.cells) {
        [cell endAnimation:1];
    }
}

@end
