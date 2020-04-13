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
@property (readonly, nonatomic) NSDictionary *authorDictionary;
@property (readonly, nonatomic) NSDictionary *bookDictionary;
@property (strong, nonatomic) RLMStoreController *storeController;
@property (strong, nonatomic) RLMReadingList *readingList;
@end

@implementation ReadingListModelTests

- (NSDictionary *)authorDictionary {
    return @{
        RLMAuthorKeys.firstName : @"Ernest",
        RLMAuthorKeys.lastName : @"Hemingway"
    };
}

- (NSDictionary *)bookDictionary {
    return @{
        RLMBookKeys.title : @"For Whom the Bell Tolls",
        RLMBookKeys.year : @"1940",
        RLMBookKeys.author : self.authorDictionary
    };
}

- (void)testCreateAuthor {
    RLMAuthor *author = [RLMAuthor modelObjectWithDictionary:self.authorDictionary];
    NSLog(@"%@", author.fullName);
    [self.storeController saveReadingList:self.readingList];
}

- (void)testCreateBook {
    RLMBook *book = [RLMBook modelObjectWithDictionary:self.bookDictionary];
    [self.readingList insertBook:book atIndexPath:[NSIndexPath indexPathWithIndex:1]];
    [self.storeController saveReadingList:self.readingList];
    NSLog(@"%@", book.author.fullName);
    NSLog(@"%@", book.title);
    XCTAssertEqual(self.readingList.books.count, self.storeController.fetchedReadingList.books.count);
}

//TODO:- Load current reading list, add the new book, compare the count change
- (void)testChangeTollsToClangs{

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

@end
