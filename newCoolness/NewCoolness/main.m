//
//  main.m
//  NewCoolness
//
//  Created by Peter Victoratos on 2/24/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NCVAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([NCVAppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
