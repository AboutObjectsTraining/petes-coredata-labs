//
//  RLTAuthor.m
//  ReadingListModelTests
//
//  Created by Peter Victoratos on 3/18/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import "RLTAuthor.h"

const struct RLTAuthorKeys RLTAuthorKeys = {
    .firstName = @"firstName",
    .lastName = @"lastName"
};

@implementation RLTAuthor

+ (NSArray *)keys
{
    return @[RLTAuthorKeys.firstName, RLTAuthorKeys.lastName];
}

- (NSString *)fullName
{
    if (self.lastName == nil && self.firstName == nil) { return @"Unknown"; }
    if (self.lastName == nil)  { return self.firstName; }
    if (self.firstName == nil) { return self.lastName; }
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (NSString *)description
{
    return self.fullName;
}

@end
