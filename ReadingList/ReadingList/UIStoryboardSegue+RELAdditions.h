//
//  UIStoryboardSegue+RELAdditions.h
//  ReadingList
//
//  Created by Peter Victoratos on 4/10/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboardSegue (RELAdditions)
@property (readonly, nonatomic) id rel_destinationViewController;
@end
