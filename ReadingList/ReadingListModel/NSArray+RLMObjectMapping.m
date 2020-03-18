//
//  NSArray+RLMObjectMapping.m
//  ReadingListModel
//
//  Created by Peter Victoratos on 3/18/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import "NSArray+RLMObjectMapping.h"
#import "RLMModelObject.h"

@implementation NSArray (RLMObjectMapping)

- (NSArray <RLMModelObject *> *)mappedModelObjectsOfType:(Class)class
{
    NSMutableArray *modelObjs = [NSMutableArray arrayWithCapacity:self.count];
    
    for (NSDictionary *currDict in self) {
        [modelObjs addObject:[class modelObjectWithDictionary:currDict]];
    }
    
    return modelObjs;
}

@end
