//
//  RLMModelObject.h
//  ReadingListModel
//
//  Created by Peter Victoratos on 3/18/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RLMModelObject : NSObject

@property (class, readonly, nonatomic) NSArray *keys;
@property (readonly, nonatomic) NSDictionary *dictionaryRepresentation;

+ (id)modelObjectWithDictionary:(NSDictionary *)dictionary;
- (id)initWithDictionary:(NSDictionary *)dictionary;

@end

