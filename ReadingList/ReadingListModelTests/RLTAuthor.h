//
//  RLTAuthor.h
//  ReadingListModelTests
//
//  Created by Peter Victoratos on 3/18/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLTModelObject.h"

extern const struct RLTAuthorKeys {
    NSString * __unsafe_unretained firstName;
    NSString * __unsafe_unretained lastName;
} RLTAuthorKeys;

@interface RLTAuthor : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, readonly) NSString *fullName;

@end
