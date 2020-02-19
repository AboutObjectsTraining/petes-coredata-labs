//
//  NSArray+LABAdditions.m
//  UnitTests
//
//  Created by Peter Victoratos on 2/11/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import "NSArray.h"

@implementation NSArray (LABAdditions)

- (NSString *)LAB_fancyDescription
{
    NSMutableString *s = [NSMutableString stringWithFormat:@"%@ of %ld elements (",
                          [self class], [self count]];
    for (id currObj in self) {
        [s appendFormat:@"\n    %@, %@", [currObj class], currObj];
    }
    
    [s appendString:@"\n)\n"];
    
    return s;
}

@end
