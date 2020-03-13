//
//  RELSampleBook.m
//  ReadingList
//
//  Created by Pete Victoratos on 3/12/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import "RELSampleBook.h"

@implementation RELSampleBook

- (instancetype)initWithTitle:(NSString *)bookTitle authorName:(NSString *)authorName {
    self = [super init];
    if (self == nil) return nil;
    
    _bookTitle = [bookTitle copy];
    _authorName = [authorName copy];
    
    return self;
}
@end
