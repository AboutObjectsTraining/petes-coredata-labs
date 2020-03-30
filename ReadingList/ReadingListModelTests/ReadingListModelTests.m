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
    
    NSString *fileName = @"Test";
    NSString *fileType = @"rtf";
    //this gives the path for the simulator created document..? it stores it in the simulator..?
    NSLog(@"Path for document: %@", RELPathForDocument(fileName, fileType));
    
    NSDictionary *authorDictionary = [author dictionaryRepresentation];
    NSDictionary *author2Dictionary = [author2 dictionaryRepresentation];

    NSDictionary *bookDictionary = [book dictionaryRepresentation];

    NSString *bookf = [book description];
    NSEnumerator *enumerator = [bookDictionary keyEnumerator];
    NSLog(@"Description: %@", bookf);

    NSLog(@"Author keys: %@ %@", authorDictionary.allKeys.firstObject, authorDictionary.allKeys.lastObject);
    NSLog(@"Book keys: %@ %@ %@", [enumerator nextObject], [enumerator nextObject], [enumerator nextObject]);
    
    NSLog(@"Author name: %@ %@", authorDictionary.allValues.firstObject, authorDictionary.allValues.lastObject);
    NSLog(@"Book %@: %@", bookDictionary.allKeys.firstObject, bookDictionary.allValues.firstObject);
    
    NSLog(@"The author %@ wrote %@", author2Dictionary.allValues.firstObject, book2.title);
    
}

// To Do:
// • Fix error "Class RLMAuthor is implemented in both" .?
//      ** Maybe recreate the test class?
// • Stare at store controller code, write some test cases
// • The name data is not changed
// • No data is stored (saved)
// • Start picking at these error logs


@end
