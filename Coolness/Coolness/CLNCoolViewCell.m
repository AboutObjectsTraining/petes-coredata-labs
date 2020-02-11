//
//  CLNCoolViewCell.m
//  Coolness
//
//  Created by Peter Victoratos on 2/6/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import "CLNCoolViewCell.h"

const UIEdgeInsets CLNTextInsets = {
    .top = 12,
    .bottom = 12,
    .left = 12,
    .right = 12
};

// FIXME:- handle case when user has text entered in the textfield but puts an image by not adding text to cell

//UIColor to set background image
@interface CLNCoolViewCell () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (getter=isHighlighted, assign, nonatomic) BOOL highlighted;
@property (class, readonly, nonatomic) NSDictionary *textAttributes;
//should add a content view to hold the image
@end

@implementation CLNCoolViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (!(self = [super initWithFrame:frame])) return nil;
    [self configureLayer];
    [self configureGestureRecognizer];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (!(self = [super initWithCoder:coder])) return nil;
    [self configureLayer];
    [self configureGestureRecognizer];
    return self;
}

- (void)configureLayer {
    self.layer.borderWidth = 3;
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    self.layer.cornerRadius = 10;
}

- (void)configureGestureRecognizer {
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bounce)];
    recognizer.numberOfTapsRequired = 2;
    [self addGestureRecognizer:recognizer];
}

+ (NSDictionary *)textAttributes {
    return @{ NSFontAttributeName: [UIFont boldSystemFontOfSize:22],
              NSForegroundColorAttributeName: UIColor.whiteColor};
};

- (void)setHighlighted:(BOOL)highlighted{
    _highlighted = highlighted;
    self.alpha = highlighted ? 0.5 : 1.0;
}

// MARK: - Animation

- (void)bounce{
    NSLog(@"Bounce dat %s", __func__);
    [self animateBounceWithDuration:1 size:CGSizeMake(120, 240)];
}

- (void)configureBounceWithSize:(CGSize)size {
    CGAffineTransform translation = CGAffineTransformMakeTranslation(size.width, size.height);
    self.transform = CGAffineTransformRotate(translation, M_PI_2);
}

//set self.transform to CAaffineidentity
//also animate with duration

- (void)animateBounceWithDuration:(NSTimeInterval)duration size:(CGSize)size {
    //we have no idea where the self cBWS:size call will go, it could go out of scope. To guard against that,
    //we will create a weak version of self 
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                    //animations:^{ [self configureBounceWithSize:size]; }
                     animations:^{ [weakSelf configureBounceWithSize:size]; }
                     completion:nil];
}

- (void)endAnimation:(NSTimeInterval)duration {
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:duration animations:^{
        [weakSelf setTransform:CGAffineTransformIdentity];
    }];
}
// MARK: - Image import

- (void)importImage:(UIImage *)image{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.allowsEditing = YES;
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
}





// MARK: - Drawing and Resizing

- (void)setText:(NSString *)text{
    _text = [text copy];
    [self sizeToFit];
}


// Should create a random cool cell color chooser

- (CGSize)sizeThatFits:(CGSize)rect{
    CGSize newSize = [self.text sizeWithAttributes:self.class.textAttributes];
    newSize.width += CLNTextInsets.left + CLNTextInsets.right;
    newSize.height += CLNTextInsets.top + CLNTextInsets.bottom;
    return newSize;
}

- (void)drawRect:(CGRect)rect {
    //draw me a rectangle baby cakes
    [self.text drawAtPoint:CGPointMake(CLNTextInsets.left, CLNTextInsets.right) withAttributes:self.class.textAttributes];
}

// MARK: - UIResponder Methods

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.superview bringSubviewToFront:self];
    self.highlighted = YES;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint currentLocation = [touch locationInView:nil];
    CGPoint previousLocation = [touch previousLocationInView:nil];
    
    self.frame = CGRectOffset(self.frame,
                              currentLocation.x - previousLocation.x,
                              currentLocation.y - previousLocation.y);
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.highlighted = NO;
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.highlighted = NO;
}
@end
