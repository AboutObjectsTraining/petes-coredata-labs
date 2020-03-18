//
//  RLMBook.h
//  ReadingListModel
//
//  Created by Peter Victoratos on 3/18/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLMModelObject.h"

extern const struct RLMBookKeys {
    NSString * __unsafe_unretained title;
    NSString * __unsafe_unretained year;
    NSString * __unsafe_unretained author;
} RLMBookKeys;


@class RLMAuthor;

@interface RLMBook : RLMModelObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *year;
@property (nonatomic, retain) RLMAuthor *author;

@end
