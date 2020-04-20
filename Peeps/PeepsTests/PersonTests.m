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

- (void)testFullName {
    Person *fred = [[Person alloc] init];
    
    fred.firstName = @"Fred";
    fred.lastName = @"Smith";
//    [fred setFirstName:@"Fred"];
//    [fred setLastName:@"Smith"];
    
    NSLog(@"full name is %@", [fred fullName]);
}

- (void)testInitializer {
    Person *fred = [[Person alloc] initWithFirstName:@"Fred" lastName:@"Smith"];
    NSLog(@"full name is %@", [fred fullName]);
}

- (void)testFactoryMethod {
    Person *fred = [Person personWithFirstName:@"Fred" lastName:@"Smith"];
    NSLog(@"full name is %@", [fred fullName]);
}

- (void)testArrayOfPerson {
    Person *p1 = [Person personWithFirstName:@"Joe" lastName:@"Blank"];
    Person *p2 = [Person personWithFirstName:@"Sally" lastName:@"Johnson"];
    Person *p3 = [Person personWithFirstName:@"Gil" lastName:@"Amelio"];
    
    NSArray *peeps = [NSArray arrayWithObjects:p1, p2, p3, nil];
    
    for (Person *currPerson in peeps) {
        NSLog(@"%@", currPerson);
    }
    
    for (Person *currPerson in [peeps reverseObjectEnumerator]) {
        NSLog(@"%@", currPerson);
    }
}

- (void)testArrayLiterals {
    NSArray *peeps = @[
        [Person personWithFirstName:@"Joe" lastName:@"Blank"],
        [Person personWithFirstName:@"Sally" lastName:@"Johnson"],
        [Person personWithFirstName:@"Gil" lastName:@"Amelio"]
    ];
    NSLog(@"%@", peeps);
    
    [peeps makeObjectsPerformSelector:@selector(setLastName:) withObject:@"Jones"];
    NSLog(@"%@", peeps);
}

- (void)testCopyingBehavior {
    Person *p1 = [Person personWithFirstName:@"Joe" lastName:@"Blank"];
//    [p1 performSelector:@selector(copyWithZone:)];
    Person *p2 = [p1 copy];
    NSLog(@"%@", p2);
}

@end
