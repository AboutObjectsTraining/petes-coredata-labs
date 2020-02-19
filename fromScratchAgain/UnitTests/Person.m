//
//  Person.m
//  UnitTests
//
//  Created by Peter Victoratos on 2/18/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)initWithFullName:(NSString *)firstName lastName:(NSString *)lastName age:(int)age
{
    self = [super init];
    if (!self) return nil;
    
    _firstName = [firstName copy];
    _lastName = [lastName copy];
    _age = age;
    
    return self;
}

+ (instancetype)personWithFullName:(NSString *)firstName lastName:(NSString *)lastName age:(int)age{
    return [self.alloc initWithFullName:firstName lastName:lastName age:age];
}

- (NSString *)fullName{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (NSString *)description{
    return [NSString stringWithFormat:@"\n%@, %d years old.", self.fullName, self.age];
}

- (void)display {
    printf("%s\n", [self.description UTF8String]);
}

const NSUInteger MaxRating = 5;

- (void)setRating:(NSUInteger)newValue
{
    _rating = newValue > MaxRating ? MaxRating : newValue;
}

- (NSString *)ratingStars
{
    if (self.rating == 0) return @"-";
    return [@"*****" substringToIndex:self.rating];
}

@end
