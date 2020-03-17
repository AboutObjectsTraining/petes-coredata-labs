//
//  RELSampleBook.m
//  ReadingList
//
//  Created by Pete Victoratos on 3/12/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import "RELSampleBook.h"

@implementation RELSampleBook

- (instancetype)initWithTitle:(NSString *)bookTitle authorName:(NSString *)authorName bookYear:(NSNumber *)bookYear {
    self = [super init];
    if (self == nil) return nil;
    
    _bookTitle = [bookTitle copy];
    _authorName = [authorName copy];
    _bookYear = [bookYear copy];
    
    return self;
}

//- (NSArray *)returnAuthorName:(NSString *)authorName {
//    NSArray *fullName = [authorName componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" "]];
//    return fullName;
//}

//only the book should know about how the author property is handled

//getter and setter for first name. assuming a two part name
- (NSString *)authorFirstName {
    return [self.authorName componentsSeparatedByString:@" "].firstObject;
}

//getter and setter for last name. assuming a two part name
- (NSString *)authorLastName {
    return [self.authorName componentsSeparatedByString:@" "].lastObject;
}
@end
