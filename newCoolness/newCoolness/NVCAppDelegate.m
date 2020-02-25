//
//  NVCAppDelegate.m
//  newCoolness
//
//  Created by Peter Victoratos on 2/24/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import "NVCAppDelegate.h"

@implementation NVCAppDelegate

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"In %s", __func__);
    [UIApplication.sharedApplication sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
