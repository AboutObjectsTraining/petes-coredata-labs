//
//  ReadingListModelTests.m
//  ReadingListModelTests
//
//  Created by Peter Victoratos on 3/17/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <ReadingListModel/ReadingListModel.h>

@interface ReadingListModelTests : XCTestCase
@end

@implementation ReadingListModelTests

- (void)setUp {
    // Create author object
    // Access class method keys in RLTAuthor
}

- (void)testExample {
    RLMAuthor *author = [[RLMAuthor alloc] initWithDictionary:@{@"firstName" : @"John", @"lastName" : @"Doe"}];
    RLMBook *book = [[RLMBook alloc] initWithDictionary:@{@"title" : @"My Average Life",
                                                          @"year"  : @"1991",
                                                          @"author": author}];
    
    NSLog(@"%@", book.year);
    
    NSDictionary *authorDictionary = [author dictionaryRepresentation];
    NSDictionary *bookDictionary = [book dictionaryRepresentation];
    
    // Get the keys for the given values and NSLog 'em
    NSLog(@"Author keys: %@ %@", authorDictionary.allKeys.firstObject, authorDictionary.allKeys.lastObject);
    NSLog(@"Book keys: %@ %@", bookDictionary.allKeys.firstObject, bookDictionary.allKeys.lastObject);
    // Get the values for the given keys and NSLog 'em
    NSLog(@"Author values: %@ %@", authorDictionary.allValues.firstObject, authorDictionary.allValues.lastObject);
    NSLog(@"Book values: %@ %@", bookDictionary.allKeys.firstObject, bookDictionary.allValues.lastObject);
}

// To Do:
// Fix error "Class RLMAuthor is implemented in both"

// NSDictionary *dictionary = @{
//    @"name" : NSUserName(),
//    @"date" : [NSDate date],
//    @"processInfo" : [NSProcessInfo processInfo]
//};    A dictionary literal

// (NSDictionary<String *, id> *)dictionaryWithValuesForKeys:(NSArray<NSString *> *)keys;

// (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *, id> *)keyedValues;

@end
