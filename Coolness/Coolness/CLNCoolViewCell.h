//
//  CLNCoolViewCell.h
//  Coolness
//
//  Created by Peter Victoratos on 2/6/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface CLNCoolViewCell : UIView
@property (copy, nonatomic) IBInspectable NSString *text;
- (void)endAnimation: (NSTimeInterval) duration;
@end
