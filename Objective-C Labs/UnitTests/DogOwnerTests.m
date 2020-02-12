//
//  DogOwnerTests.m
//  UnitTests
//
//  Created by Peter Victoratos on 2/11/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+LABAdditions.h"
#import "DogOwner.h"
#import "Dog.h"

@interface DogOwnerTests : XCTestCase

@end

@implementation DogOwnerTests
{
    DogOwner *_owner;
}

- (void)setUp
{
    // -- what purpose does the setUp method have
    // -- in some cases we don't use it.. why is that?
    [super setUp];
    //is it becuase we are dealing with private member variables?
    //the only ivar is a private pointerh here..
    
    _owner = [[DogOwner alloc] initWithFullName:@"Fred" lastName:@"Flintstone" age:41];
    
    Dog *bowser = [[Dog alloc] initWithName:@"Bowser"];
    Dog *foofie = [[Dog alloc] initWithName:@"foofie"];
    Dog *spot = [[Dog alloc] initWithName:@"Spot"];
    
    [_owner addDogs:@[bowser, foofie, spot]];
}

- (void)testPart01
{
    NSLog(@"%@", _owner);
    [[_owner dogs] makeObjectsPerformSelector:@selector(doorbellDidRing)];
}

- (void)testPart02
{
    [[_owner dogs][0] setDelegate:_owner];
    [[_owner dogs][1] setDelegate:_owner];
    [[_owner dogs] makeObjectsPerformSelector:@selector(doorbellDidRing)];
}

- (void)testPart03
{
    NSLog(@"%@", [[_owner dogs] LAB_fancyDescription]);
}


@end
