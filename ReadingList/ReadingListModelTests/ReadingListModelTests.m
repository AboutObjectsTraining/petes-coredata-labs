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

- (void)testModelObjectDictionaries {
    RLMAuthor *author = [[RLMAuthor alloc] initWithDictionary:@{@"firstName" : @"John", @"lastName" : @"Doe"}];
    RLMAuthor *author2 = [[RLMAuthor alloc] initWithDictionary:@{@"firstName" : @"Arthur", @"lastName" : @"Arthur"}];
    
    
    RLMBook *book = [[RLMBook alloc] initWithDictionary:@{@"title" : @"My Average Life",
                                                          @"year"  : @"1991",
                                                          @"author": author}];
    RLMBook *book2 = [[RLMBook alloc] initWithDictionary:@{@"title" : @"Chasing Salmon",
                                                          @"year"  : @"1919",
                                                          @"author": author2}];
    
    NSDictionary *authorDictionary = [author dictionaryRepresentation];
    NSDictionary *author2Dictionary = [author2 dictionaryRepresentation];

    NSDictionary *bookDictionary = [book dictionaryRepresentation];

    NSString *bookf = [book description];
    NSLog(@"Description: %@", bookf);

    NSLog(@"Author keys: %@ %@", authorDictionary.allKeys.firstObject, authorDictionary.allKeys.lastObject);
    NSLog(@"Book keys: %@", bookDictionary.allKeys);
    
    NSLog(@"Author name: %@ %@", authorDictionary.allValues.firstObject, authorDictionary.allValues.lastObject);
    NSLog(@"Book %@: %@", bookDictionary.allKeys.firstObject, bookDictionary.allValues.firstObject);
    
    NSLog(@"The Author: %@ wrote %@", author2Dictionary.allValues.firstObject, book2.dictionaryRepresentation);
    
}

// To Do:
// • Fix error "Class RLMAuthor is implemented in both" .?
//      ** Maybe recreate the test class?

// • Format nested dictionaries
// • Make it so that there can be multiple authors
// • Add image property (import image assets named after author's surname
// • Stare at store controller code, write some test cases

// • Make this test run without running the simulator
//      ** I tried to set the active scheme to My Mac but then
//      ** it loses the framework ReadingListModel :/

@end
