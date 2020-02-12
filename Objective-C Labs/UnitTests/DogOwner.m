//
//  DogOwner.m
//  UnitTests
//
//  Created by Peter Victoratos on 2/11/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import "DogOwner.h"
#import "Dog.h"

@implementation DogOwner

- (NSArray *)dogs
{
    return [self mutableDogs];
}

// -- why do we use private member variables in this instance?
- (NSMutableArray *)mutableDogs
{
    if (_dogs == nil) {
        _dogs = [NSMutableArray array];
    }
    
    return _dogs;
}
//

- (void)addDogs:(NSArray *)newDogs
{
    [[self mutableDogs] addObjectsFromArray:newDogs];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"\nOwner: %@\nDogs: %@", [self fullName], [self dogs]];
}

- (void)dogDidHearDoorbell:(Dog *)dog
{
    if ([[dog name] isEqualToString:@"Bowser"] ||
        [[dog name] isEqualToString:@"foofie"])
    {
        [dog sit];
    }
}

// -- what would happen if yes?
- (BOOL)dogShouldBark:(Dog *)dog
{
    return NO;
}
//

- (BOOL)dogShouldWagTail:(Dog *)dog
{
    return NO;
}
@end
