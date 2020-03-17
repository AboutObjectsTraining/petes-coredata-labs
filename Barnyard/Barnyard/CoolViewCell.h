//
//  CoolViewCell.h
//  Barnyard
//
//  Created by Peter Victoratos on 3/16/20.
//  Copyright © 2020 AO. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface CoolViewCell : UIView
@property (copy, nonatomic) IBInspectable NSString *text;
- (UIColor *)randomColor;
@end

