//
//  RLMReadingList.h
//  ReadingListModel
//
//  Created by Peter Victoratos on 3/18/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLMModelObject.h"

@class RLMBook;

extern const struct RLMReadingListKeys {
    NSString * __unsafe_unretained title;
    NSString * __unsafe_unretained books;
} RLMReadingListKeys;


@interface RLMReadingList : RLMModelObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray *books;

@end


@interface RLMReadingList (RLMRelationshipAccessors)

- (RLMBook *)bookAtIndexPath:(NSIndexPath *)indexPath;
- (void)insertBook:(RLMBook *)book atIndexPath:(NSIndexPath *)indexPath;
- (void)removeBookAtIndexPath:(NSIndexPath *)indexPath;
- (void)moveBookAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)destinationIndexPath;

@end
