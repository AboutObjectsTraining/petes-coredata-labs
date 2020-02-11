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
@property (strong, nonatomic) IBOutletCollection(NSMutableArray) NSMutableArray *cells;
@end

@implementation CLNCoolViewController

// need to add background assets to content view programatically

- (NSMutableArray *)cells {
    if (_cells == nil) {
        _cells = [[NSMutableArray alloc] init];
    }
    return _cells;
}

// MARK: - Action Methods
//add cell to iboutletcollection programmatically here
//maybe case 1 will not handle image imports but will just put out a random cell
- (IBAction)addCell{
    CLNCoolViewCell *cell = [[CLNCoolViewCell alloc] init];
    cell.backgroundColor = UIColor.systemPinkColor;
    cell.clipsToBounds = YES;
    [self.contentView addSubview:cell];
    [self.cells addObject:cell];
    switch (_segmentedContol.selectedSegmentIndex) {
        case 0:
            //this case will handle text cells
            cell.text = self.textField.text;
            break;
        case 1:
            //this case will handle image imports
            //should open up photo library when user taps + 
            break;
            
        default:
            break;
    }
}

//will respond to a double tap by putting cells back in their original place. should loop through cells in the IBoutletcollection
- (IBAction)endAnimations {
    for (CLNCoolViewCell *cell in self.cells) {
        [cell endAnimation:1];
    }
}

// to handle stopping animations
// keep a property that holds array of cells send a general message that makes all of them stop moving. [IBOutletCollection] IB created cells should be added to array and the ones created through the UI should be dynamically put into the array as well

// MARK: - Cell Configuration Methods
//- (void)setImageInCell{
//    NSLog(@"In %s", __func__);
//    CLNCoolViewCell *cell = [[CLNCoolViewCell alloc] init];
//    //[imageSubview a];
//    UIImage *userImage = UIImagePickerControllerSourceTypePhotoLibrary;
//    userImage.imageRendererFormat.scale = .2;
//    [self.contentView addSubview:cell];
//}

//- (void)setTextInCell{
//    NSLog(@"In %s", __func__);
//    CLNCoolViewCell *cell = [[CLNCoolViewCell alloc] init];
//    cell.text = self.textField.text;
//    cell.backgroundColor = UIColor.systemPinkColor;
//    cell.clipsToBounds = YES;
//    [self.contentView addSubview:cell];
//}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
