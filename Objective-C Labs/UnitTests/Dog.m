//
//  Dog.m
//  UnitTests
//
//  Created by Peter Victoratos on 2/11/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (id)initWithName:(NSString *)name
{
    // -- what is this checking for again?
    if (!(self = [super init])) return nil;
    
    _name = [name copy];
    
    return self;
    //checks for void pretty much
}

// -- why does this method get a pointer?
- (NSString *)name {
    return _name;
}
//

// -- why do these methods [[self name] UTF8String]?
- (void)growl
{
    printf("%s: Grrrrr!\n", [[self name] UTF8String]);
}

- (void)bark
{
    printf("%s: Woof! Woof!\n", [[self name] UTF8String]);
}

- (void)wagTail
{
    printf("%s: [Wags tail.]\n", [[self name] UTF8String]);
}
//[self name] is us grabbing the name from self (being the general dog class)
//UTF8String formats it so that its readable

- (NSString *)description
{
    return [self name];
}

- (id<DogDelegate>)delegate {
    return _delegate;
}

- (void)setDelegate:(id<DogDelegate>)delegate {
    _delegate = delegate;
}

- (void)doorbellDidRing
{
    [self growl];
    
    // -- the dog delegate is dealing with the doorbell by refering to itself, bc
    // -- its not only a dog, its a dog delegate
    [_delegate dogDidHearDoorbell:self];
    
    
    // -- why would the delegate be nil?
    if (_delegate == nil || [_delegate dogShouldBark:self]) {
        [self bark];
    }
    
    if (_delegate == nil || [_delegate dogShouldWagTail:self]) {
        [self wagTail];
    }
}

- (void)sit {
    printf("%s: [Sits.]\n", [[self name] UTF8String]);
}
@end
