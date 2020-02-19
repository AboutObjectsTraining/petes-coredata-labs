//
//  UnitTests.m
//  UnitTests
//
//  Created by Peter Victoratos on 2/18/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"

@interface UnitTests : XCTestCase

@end

@implementation UnitTests

- (void)testPart01{
    Person *fred = [[Person alloc] init];
    fred.firstName = @"Fred";
    fred.lastName = @"Flintstone";
    fred.age = 41;
    
    NSLog(@"\n%@ %@ is %d years old.", fred.firstName, fred.lastName, fred.age);
}

- (void)testPart02{
    Person *fred2 = [[Person alloc] init];
    fred2.firstName = @"Fred";
    fred2.lastName = @"Fredburger";
    fred2.age = 58;
    
    NSLog(@"\n%@", fred2.fullName);
    NSLog(@"\n%@", fred2.description);
    NSLog(@"\n%@", fred2);
}

- (void)testPart03
{
    NSArray *people = @[[Person personWithFullName:@"Fred" lastName:@"Flintstone" age:41], [Person personWithFullName:@"Barney" lastName:@"Rubble" age:38],        [Person personWithFullName:@"George" lastName:@"Slate" age:54]];
    
    for (Person *current in people)
    {
        [current display];
    }
}

- (void)testPart04
{
    NSArray *people = @[[Person personWithFullName:@"Fred" lastName:@"Smith" age:32],
                        [Person personWithFullName:@"Jill" lastName:@"Brown" age:27],
                        [Person personWithFullName:@"Lee" lastName:@"Jones" age:41],
                        [Person personWithFullName:@"Greg" lastName:@"Moore" age:25],
                        [Person personWithFullName:@"Sue" lastName:@"Davis" age:36]];
    [people[0] setRating:3];
    [people[1] setRating:999];
    [people[2] setRating:0];
    [people[3] setRating:3];
    [people[4] setRating:4];
    printf("\nPeople:\n-------\n");
    for (Person *currPerson in people) {
        [currPerson display];
    }
    NSSortDescriptor *sortDesc = [NSSortDescriptor
    sortDescriptorWithKey:@"rating"ascending:NO];
    NSArray *sortedPeeps = [people sortedArrayUsingDescriptors:@[sortDesc]];
    printf("\nSorted People:\n--------------\n"); for (Person *currPerson in sortedPeeps) {
        [currPerson display];
    }
    [sortedPeeps makeObjectsPerformSelector:@selector(display)];
}

@end
