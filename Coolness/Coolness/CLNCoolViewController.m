//
//  CLNCoolViewController.m
//  Coolness
//
//  Created by Peter Victoratos on 2/6/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import "CLNCoolViewController.h"
#import "CLNCoolViewCell.h"

@interface CLNCoolViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedContol;
@end

@implementation CLNCoolViewController

// need to add background assets to content view programatically

// MARK: - Action Methods

- (IBAction)addCell{
    switch (_segmentedContol.selectedSegmentIndex) {
        case 0:
            //this case will handle text cells
            [self addTextToCell];
            break;
        case 1:
            //this case will handle image imports
            //should open up photo library when user taps + 
            [self addImageToCell];
            break;
            
        default:
            break;
    }
}

// MARK: - Cell Configuration Methods
- (void)addImageToCell{
    NSLog(@"In %s", __func__);
    CLNCoolViewCell *cell = [[CLNCoolViewCell alloc] init];
    UIView *imageSubview = [[UIView alloc] init];
    [cell addSubview:imageSubview];
    //[imageSubview a];
    UIImage *userImage = UIImagePickerControllerSourceTypePhotoLibrary;
    userImage.imageRendererFormat.scale = .2;
    [self.contentView addSubview:cell];
    
}

- (void)addTextToCell{
    NSLog(@"In %s", __func__);
    CLNCoolViewCell *cell = [[CLNCoolViewCell alloc] init];
    cell.text = self.textField.text;
    cell.backgroundColor = UIColor.systemPinkColor;
    cell.clipsToBounds = YES;
    [self.contentView addSubview:cell];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
