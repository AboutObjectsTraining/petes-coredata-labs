//
//  RLMAuthor.h
//  ReadingListModel
//
//  Created by Peter Victoratos on 3/18/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLMModelObject.h"

extern const struct RLMAuthorKeys {
    NSString * __unsafe_unretained firstName;
    NSString * __unsafe_unretained lastName;
} RLMAuthorKeys;

@interface RLMAuthor : RLMModelObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, readonly) NSString *fullName;

@end
