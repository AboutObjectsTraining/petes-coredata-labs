//
//  CoolViewCell.m
//  Barnyard
//
//  Created by Peter Victoratos on 3/16/20.
//  Copyright © 2020 AO. All rights reserved.
//

#import "CoolViewCell.h"

const UIEdgeInsets NCVTextInsets = {
    .top = 12,
    .bottom = 12,
    .left = 12,
    .right = 12
};

@interface CoolViewCell () <UINavigationControllerDelegate>
@property (getter=isHighlighted, assign, nonatomic) BOOL highlighted;
@property (class, readonly, nonatomic) NSDictionary *textAttributes;
@end

@implementation CoolViewCell

// MARK: - Setup & Configuration

- (instancetype)initWithFrame:(CGRect)frame {
    if (!(self == [super initWithFrame:frame])) return nil;
    [self configureLayer];
    [self configureGestureRecognizer];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (!(self == [super initWithCoder:coder])) return nil;
    [self configureLayer];
    [self configureGestureRecognizer];
    return self;
}

- (void)configureLayer {
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    self.layer.borderWidth = 3;
    self.layer.cornerRadius = 10;
}

- (void)configureGestureRecognizer {
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bounce)];
    recognizer.numberOfTapsRequired = 2;
    [self addGestureRecognizer:recognizer];
}

// MARK: - Cell Properties

+ (NSDictionary *)textAttributes {
    return @{ NSFontAttributeName: [UIFont boldSystemFontOfSize:22],
              NSForegroundColorAttributeName: UIColor.whiteColor};
};

- (void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;
    self.alpha = highlighted ? 0.5 : 1.0;
}

// MARK: - Drawing & Resizing Cells

- (void)setText:(NSString *)text{
    _text = [text copy];
    [self sizeToFit];
}

- (CGSize)sizeThatFits:(CGSize)rect {
    CGSize newSize = [self.text sizeWithAttributes:self.class.textAttributes];
    newSize.width += NCVTextInsets.left + NCVTextInsets.right;
    newSize.height += NCVTextInsets.top + NCVTextInsets.left;
    return newSize;
}

- (void)drawRect:(CGRect)rect {
    [self.text drawAtPoint:CGPointMake(NCVTextInsets.left, NCVTextInsets.right) withAttributes:self.class.textAttributes];
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

- (void)animateBounceWithDuration:(NSTimeInterval)duration size:(CGSize)size {
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{ [weakSelf configureBounceWithSize:size]; }
                     completion:nil];
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

- (UIColor *)randomColor {
    CGFloat r = (float)(arc4random()%256) / 255.f;
    CGFloat g = (float)(arc4random()%256) / 255.f;
    CGFloat b = (float)(arc4random()%256) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

@end
