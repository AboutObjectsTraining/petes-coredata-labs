//
//  UIColor+RELAppearance.m
//  ReadingList
//
//  Created by Peter Victoratos on 4/10/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import "UIColor+RELAppearance.h"

@implementation UIColor (RELAppearance)

static NSString * const reuseIdentifier = @"Cell";

+ (UIColor *)tintColor { return [UIColor colorNamed:@"Tint Color"]; }
+ (UIColor *)cellColor { return [UIColor colorNamed:@"Cell Color"]; }

@end
