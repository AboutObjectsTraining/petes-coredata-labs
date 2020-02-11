//
//  Person.m
//  Objective-C Labs
//
//  Created by Peter Victoratos on 2/10/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import "Person.h"

@implementation Person

// -- why do i need this class method that returns an instancetype?
+ (instancetype)personWithFullName:(NSString *)firstName lastName:(NSString *)lastName age:(int)age
{
    return [[self alloc] initWithFullName:firstName lastName:lastName age:age];
}
// because it is an instance of a Person (with a firstname)

- (id)initWithFullName:(NSString *)firstName lastName:(NSString *)lastName age:(int)age
{
    self = [super init];
    // -- why do we do this?
    if (!self) return nil;
    //an example could be: [[NSData alloc] initWithContentsOfFile:@"this/path/doesn't/exist/"];
    
    _firstName = [firstName copy];
    _lastName = [lastName copy];
    _age = age;
    
    return self;
}

const NSUInteger MaxRanking = 5;

- (NSString *)firstName {
    return _firstName;
}
- (void)setFirstName:(NSString *)newValue {
    _firstName = newValue;
}
- (NSString *)lastName {
    return _lastName;
}
- (void)setLastName:(NSString *)newValue {
    _lastName = newValue;
}
- (int)age {
    return _age;
}
- (void)setAge:(int)newValue {
    _age = newValue;
}

- (NSUInteger)favoritesRanking
{
    return _favoritesRanking;
}

- (void)setFavoritesRanking:(NSUInteger)newValue
{
    _favoritesRanking = newValue > MaxRanking ? MaxRanking : newValue;
}

- (NSString *)favoritesRankingStars
{
    if ([self favoritesRanking] == 0) return @"-";
    return [@"*****" substringToIndex:[self favoritesRanking]];
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
}
- (NSString *)description {
    NSString *stars = [self favoritesRankingStars];
    stars = [stars stringByPaddingToLength:MaxRanking withString:@" " startingAtIndex:0];
    return [NSString stringWithFormat:@"%@ %@", stars, [self fullName]];
}

- (void)display {
    printf("%s\n", [[self description] UTF8String]);
}

@end
