// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import <Peeps/Peeps.h>

@interface PersonTests : XCTestCase
@end

@implementation PersonTests

- (void)testCreatePerson {
    Person *fred = [[Person alloc] init];
    [fred setFirstName:@"Fred"];
    NSLog(@"class is %@: %p, first name is %@", [fred class], [fred class], [fred firstName]);
    
    NSLog(@"In %s", __func__);
}

- (void)testPopulatePerson {
    Person *fred = [[Person alloc] init];
    [fred setFirstName:@"Fred"];
    [fred setLastName:@"Smith"];
    
    NSLog(@"first name is %@", [fred firstName]);
}

@end
