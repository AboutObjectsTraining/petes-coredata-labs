//
//  UnitTests.m
//  UnitTests
//
//  Created by Peter Victoratos on 2/10/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"

@interface UnitTests : XCTestCase

@end

@implementation UnitTests

- (void)testPart01
{
    Person *fred = [[Person alloc] init];
    [fred setFirstName:@"Fred"];
    [fred setLastName:@"Flintstone"];
    [fred setAge: 41];
    
    NSLog(@"\nfirst name: %@"
          @"\nlast name: %@"
          @"\nage: %d",
          [fred firstName],
          [fred lastName],
          [fred age]);
}

- (void)testPart02
{
    Person *fred = [[Person alloc] init];
    [fred setFirstName:@"Fred"];
    [fred setLastName:@"Flintstone"];
    [fred setAge: 41];
    
    NSLog(@"\nFull name: %@", [fred fullName]);
    NSLog(@"\nDescription: %@", [fred description]);
    NSLog(@"\nCalling Just Fred: %@", fred);
}

- (void)testPart03
{
    NSArray *people = @[[Person personWithFullName:@"Fred" lastName:@"Flintstone" age:41],        [Person personWithFullName:@"Barney" lastName:@"Rubble" age:38],        [Person personWithFullName:@"George" lastName:@"Slate" age:54]];
    
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
    [people[0] setFavoritesRanking:3];
    [people[1] setFavoritesRanking:999];
    [people[2] setFavoritesRanking:0];
    [people[3] setFavoritesRanking:3];
    [people[4] setFavoritesRanking:4];
printf("\nPeople:\n-------\n");
for (Person *currPerson in people) {
        [currPerson display];
    }
    NSSortDescriptor *sortDesc = [NSSortDescriptor
                                  sortDescriptorWithKey:@"favoritesRanking"
                                  ascending:NO];
    NSArray *sortedPeeps = [people sortedArrayUsingDescriptors:@[sortDesc]];
printf("\nSorted People:\n--------------\n"); for (Person *currPerson in sortedPeeps) {
        [currPerson display];
    }
    [sortedPeeps makeObjectsPerformSelector:@selector(display)];
}

- (void)testPart05
{
    NSArray *people = @[[Person personWithFullName:@"Fred" lastName:@"Smith" age:32],
                        [Person personWithFullName:@"Jill" lastName:@"Brown" age:27],
                        [Person personWithFullName:@"Al" lastName:@"Smith" age:41],
                        [Person personWithFullName:@"Greg" lastName:@"Brown" age:25],
                        [Person personWithFullName:@"Sue" lastName:@"Davis" age:36]];
    [people[0] setFavoritesRanking:3];
    [people[1] setFavoritesRanking:2];
    [people[2] setFavoritesRanking:3];
    [people[3] setFavoritesRanking:2];
    [people[4] setFavoritesRanking:3];
printf("\nPeople:\n-------\n");
for (Person *currPerson in people) {
        [currPerson display];
    }
    NSSortDescriptor *d1 = [NSSortDescriptor
                            sortDescriptorWithKey:@"favoritesRanking"
                            ascending:NO];
    NSSortDescriptor *d2 = [NSSortDescriptor
                            sortDescriptorWithKey:@"lastName"
                            ascending:YES];
    NSSortDescriptor *d3 = [NSSortDescriptor
                            sortDescriptorWithKey:@"firstName"
                            ascending:YES];
    NSArray *sortedPeeps = [people sortedArrayUsingDescriptors:@[d1, d2, d3]];
printf("\nSorted People:\n--------------\n");
    [sortedPeeps makeObjectsPerformSelector:@selector(display)];
}

@end
