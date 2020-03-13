//
//  RELSampleBook.h
//  ReadingList
//
//  Created by Pete Victoratos on 3/12/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RELSampleBook : NSObject
- (instancetype)initWithTitle:(NSString *)bookTitle authorName:(NSString *)authorName;
@property(nonatomic, copy) NSString *bookTitle;
@property(nonatomic, copy) NSString *authorName;
@end

