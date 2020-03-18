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
    RLMAuthor *author = nil;
    NSLog(@"%@", author);
    // Get the keys for the given values and NSLog 'em
//    RLTAuthor *author = [RLTModelObject dictionaryWithValuesForKeys:[RLTAuthor keys]];
    // Get the values for the given keys and NSLog 'em
}

// NSDictionary *dictionary = @{
//    @"name" : NSUserName(),
//    @"date" : [NSDate date],
//    @"processInfo" : [NSProcessInfo processInfo]
//};    A dictionary literal

// (NSDictionary<String *, id> *)dictionaryWithValuesForKeys:(NSArray<NSString *> *)keys;

// (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *, id> *)keyedValues;

@end
