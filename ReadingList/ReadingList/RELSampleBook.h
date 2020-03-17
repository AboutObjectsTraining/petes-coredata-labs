//
//  RELSampleBook.h
//  ReadingList
//
//  Created by Pete Victoratos on 3/12/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RELSampleBook : NSObject
- (instancetype)initWithTitle:(NSString *)bookTitle authorName:(NSString *)authorName bookYear:(NSNumber *) bookYear;
@property(nonatomic, copy) NSString *bookTitle;
@property(nonatomic, copy) NSNumber *bookYear; //could be an int instead.
@property(nonatomic, copy) NSString *authorName;
@property(nonatomic, copy) NSString *authorFirstName;
@property(nonatomic, copy) NSString *authorLastName;
@end

