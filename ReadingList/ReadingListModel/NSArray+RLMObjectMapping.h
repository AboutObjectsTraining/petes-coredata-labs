//
//  NSArray+RLMObjectMapping.h
//  ReadingListModel
//
//  Created by Peter Victoratos on 3/18/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RLMModelObject;

@interface NSArray (RLMObjectMapping)

- (NSArray <RLMModelObject *> *)mappedModelObjectsOfType:(Class)class;

@end
