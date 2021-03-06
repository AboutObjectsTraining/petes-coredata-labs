//
//  UIStoryboardSegue+RELAdditions.m
//  ReadingList
//
//  Created by Peter Victoratos on 4/10/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import "UIStoryboardSegue+RELAdditions.h"

@implementation UIStoryboardSegue (RELAdditions)
- (id)rel_destinationViewController {
    UIViewController *controller = self.destinationViewController;
    if (![controller isKindOfClass:UINavigationController.class]) {
        return controller;
    }
    UINavigationController *navController = (UINavigationController *) controller;
    return navController.childViewControllers.firstObject;
}


@end
