//
//  Dog.m
//  UnitTests
//
//  Created by Peter Victoratos on 2/18/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import "Dog.h"

@implementation Dog
- (id)initWithName:(NSString *)name
{
    if (!(self = [super init])) return nil;
    
    self.name = [name copy];
    
    return self;
}

- (void)growl
{
    printf("%s: Grrrrr!\n", [self.name UTF8String]);
}

- (void)bark
{
    printf("%s: Woof! Woof!\n", [self.name UTF8String]);
}

- (void)wagTail
{
    printf("%s: [Wags tail.]\n", [self.name UTF8String]);
}


- (NSString *)description
{
    return self.name;
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
    [_delegate dogDidHearDoorbell:self];
    
    if (_delegate == nil || [_delegate dogShouldBark:self]) {
        [self bark];
    }
    
    if (_delegate == nil || [_delegate dogShouldWagTail:self]) {
        [self wagTail];
    }
}

- (void)sit {
    printf("%s: [Sits.]\n", [self.name UTF8String]);
}
@end
