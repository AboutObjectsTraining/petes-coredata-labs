// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Person.h"

@implementation Person

+ (instancetype)personWithFirstName:(NSString *)aFirstName
                           lastName:(NSString *)aLastName {
    return [[self alloc] initWithFirstName:aFirstName lastName:aLastName];
}

- (instancetype)initWithFirstName:(NSString *)aFirstName
                         lastName:(NSString *)aLastName {
    self = [super init];
    if (self == nil) return nil;
    
    _firstName = [aFirstName copy];
    _lastName = [aLastName copy];
    
    return self;
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", self.fullName];
}

- (id)copyWithZone:(NSZone *)zone {
    // Kinda bogus implementation -- doesn't produce a real copy.
    return self;
}

@end
