//
//  NCVCoolViewCell.h
//  NewCoolness
//
//  Created by Peter Victoratos on 2/24/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface NCVCoolViewCell : UIView
@property (copy, nonatomic) IBInspectable NSString *text;
- (void)endAnimation: (NSTimeInterval) duration;
@end
