//
//  AppDelegate.m
//  Coolness
//
//  Created by Peter Victoratos on 2/5/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import "CLNAppDelegate.h"

@implementation CLNAppDelegate

//this touches began method intercepts any touches on views that do not have self-implemented touch handlers

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"In %s", __func__);
    [UIApplication.sharedApplication sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
