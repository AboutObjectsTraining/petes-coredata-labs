//
//  Person.m
//  UnitTests
//
//  Created by Peter Victoratos on 2/18/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import "Person.h"

const NSUInteger FSAMaxRating = 5;

@implementation Person

- (id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSUInteger)age
{
    self = [super init];
    if (!self) return nil;
    
    _firstName = [firstName copy];
    _lastName = [lastName copy];
    _age = age;
    
    return self;
}

+ (instancetype)personWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSUInteger)age{
    return [self.alloc initWithFirstName:firstName lastName:lastName age:age];
}

- (NSString *)fullName{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (NSString *)description{
    return [NSString stringWithFormat:@"\n%@, %lu years old.", self.fullName, (unsigned long)self.age];
}

- (void)display {
    printf("%s\n", self.description.UTF8String);
}

- (void)setRating:(NSUInteger)newValue
{
    _rating = newValue > FSAMaxRating ? FSAMaxRating : newValue;
}

- (NSString *)ratingStars
{
    if (self.rating == 0) return @"-";
    return [@"*****" substringToIndex:self.rating];
}

@end
