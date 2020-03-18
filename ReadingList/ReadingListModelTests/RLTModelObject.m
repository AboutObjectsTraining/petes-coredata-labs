//
//  RLTModelObject.m
//  ReadingListModelTests
//
//  Created by Peter Victoratos on 3/18/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import "RLTModelObject.h"

@implementation RLTModelObject

+ (NSArray *)keys
{
    return @[];
}

+ (id)modelObjectWithDictionary:(NSDictionary *)dictionary
{
    return [[self alloc] initWithDictionary:dictionary];
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (!(self = [super init])) return nil;
    [self setValuesForKeysWithDictionary:dictionary];
    return self;
}

- (NSDictionary *)dictionaryRepresentation
{
    return [self dictionaryWithValuesForKeys:self.class.keys];
}

@end
