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
@property (readonly, nonatomic) NSDictionary *authors;
@property (readonly, nonatomic) NSDictionary *books;
@end

@implementation ReadingListModelTests

- (NSDictionary *)authors {
    return @{
        RLMAuthorKeys.firstName : @"Charles",
        RLMAuthorKeys.lastName : @"Sangster"
    };
}

- (NSDictionary *)books {
    return @{
        RLMBookKeys.title : @"Hesperus",
        RLMBookKeys.year : @"2008",
        RLMBookKeys.author : self.authors
    };
}

- (void)testCreateAuthor {
    RLMAuthor *author = [RLMAuthor modelObjectWithDictionary:self.authors];
    NSLog(@"%@", author);
}

- (void)testCreateBook {
    RLMBook *book = [RLMBook modelObjectWithDictionary:self.books];
    NSLog(@"%@", book.author);
    NSLog(@"%@", book);
}

- (void)testLoadPlist {
    NSBundle *bundle = [NSBundle bundleForClass:RLMBook.class];
    NSString *path = [bundle pathForResource:@"ReadingList" ofType:@"plist"];
    NSLog(@"%@", path);
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSLog(@"%@", dict);
}

- (void)testCreateReadingList {
    NSBundle *bundle = [NSBundle bundleForClass:RLMBook.class];
    NSString *path = [bundle pathForResource:@"ReadingList" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    RLMReadingList *readingList = [RLMReadingList modelObjectWithDictionary:dict];
    NSLog(@"%@", readingList);
}

- (void)testStoreController {
    RLMStoreController *storeController = [[RLMStoreController alloc] init];
    RLMReadingList *readingList = storeController.fetchedReadingList;
    NSLog(@"%@", readingList);
}

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


@end
