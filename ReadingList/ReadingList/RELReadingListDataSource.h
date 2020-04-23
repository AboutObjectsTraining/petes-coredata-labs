//
//  RELReadingListDataSource.h
//  ReadingList
//
//  Created by Peter Victoratos on 4/23/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RLMBook;

@interface RELReadingListDataSource : NSObject

- (RLMBook *)bookAtIndexPath:(NSIndexPath *)indexPath;
- (void)addBook:(RLMBook *)book;
- (void)save;

@end
