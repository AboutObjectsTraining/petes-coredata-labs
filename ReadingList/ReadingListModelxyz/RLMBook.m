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

@end
