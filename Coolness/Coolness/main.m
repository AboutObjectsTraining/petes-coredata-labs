//
//  main.m
//  Coolness
//
//  Created by Peter Victoratos on 2/5/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLNAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass(CLNAppDelegate.class);
    }
     return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
