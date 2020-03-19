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
    //create an array of authors and books and make some tests
    RLMAuthor *author = [[RLMAuthor alloc] initWithDictionary:@{@"firstName" : @"John", @"lastName" : @"Doe"}];
    RLMBook *book = [[RLMBook alloc] initWithDictionary:@{@"title" : @"My Average Life",
                                                          @"year"  : @"1991",
                                                          @"author": author}];
    
    
    NSDictionary *authorDictionary = [author dictionaryRepresentation];
    NSDictionary *bookDictionary = [book dictionaryRepresentation];
    NSString *bookf = [book description];
    NSLog(@"%@", bookf);

    // Get the keys for the given values and NSLog 'em
    NSLog(@"Author keys: %@ %@", authorDictionary.allKeys.firstObject, authorDictionary.allKeys.lastObject);
    NSLog(@"Book keys: %@", bookDictionary.allKeys.description);
    // Get the values for the given keys and NSLog 'em
    NSLog(@"Author name: %@ %@", authorDictionary.allValues.firstObject, authorDictionary.allValues.lastObject);
    NSLog(@"Book %@: %@", bookDictionary.allKeys.firstObject, bookDictionary.allValues.firstObject);
}

// To Do:
// • Fix error "Class RLMAuthor is implemented in both"
// • Add image property (import image assets named after author's surname
// • Stare at store controller code, write some test cases
// • Create an array of books and two or three authors & make tests

@end