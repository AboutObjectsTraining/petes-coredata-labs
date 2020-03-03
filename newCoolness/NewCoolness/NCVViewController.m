//
//  NCVViewController.m
//  NewCoolness
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
    cell.backgroundColor = [self randomColor];
    cell.clipsToBounds = YES;
    cell.text = self.textField.text;
    [self.contentView addSubview:cell];
    [self.cells addObject:cell];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self addCell];
    return YES;
}

- (IBAction)endAnimations {
    for (NCVCoolViewCell *cell in self.cells) {
        [cell endAnimation:1];
    }
}

- (UIColor *)randomColor {
    CGFloat r = (float)(arc4random()%256) / 255.f;
    CGFloat g = (float)(arc4random()%256) / 255.f;
    CGFloat b = (float)(arc4random()%256) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

@end
