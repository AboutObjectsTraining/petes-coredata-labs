//
//  RLMBook.m
//  ReadingList
//
//  Created by Pete Victoratos on 3/9/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import "RLMBook.h"
#import "RLMAuthor.h"

const struct RLMBookKeys RLMBookKeys = {
    .title = @"title",
    .year = @"year",
    .author = @"author"
};

@implementation RLMBook

+ (NSArray *)keys
{
    return @[RLMBookKeys.title, RLMBookKeys.year, RLMBookKeys.author];
}

- (NSDictionary *)dictionaryRepresentation
{
    //creates a mCopy of the dictionary holding values of whatever object is in question using the objects' keys
    NSMutableDictionary *mutableVals = [[super dictionaryWithValuesForKeys:self.class.keys] mutableCopy];
    RLMAuthor *author = mutableVals[RLMBookKeys.author];
    
    mutableVals[RLMBookKeys.author] = author.dictionaryRepresentation;
    
    return mutableVals;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:RLMBookKeys.author] && [value isKindOfClass:NSDictionary.class])
    {
        value = [RLMAuthor modelObjectWithDictionary:value];
    }
    
    [super setValue:value forKey:key];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Title: %@, Year: %@, Author: %@", self.title, self.year, self.author];
}

@end
