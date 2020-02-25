//
//  DogOwner.m
//  UnitTests
//
//  Created by Peter Victoratos on 2/18/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import "DogOwner.h"

@interface DogOwner ()
@property (strong, nonatomic) NSMutableArray *dogs;
@end

@implementation DogOwner

- (NSMutableArray *)dogs {
    if (_dogs == nil) {
        _dogs = [[NSMutableArray alloc] init];
    }
    return _dogs;
}

- (void)addDogs:(NSArray *)newDogs
{
    [self.dogs addObjectsFromArray:newDogs];
}

- (void)dogDidHearDoorbell:(Dog *)dog {
        if ([dog.name isEqualToString:@"Bowser"] ||
        [dog.name isEqualToString:@"foofie"])
    {
        [dog sit];
    }
}

- (BOOL)dogShouldBark:(Dog *)dog {
    return NO;
}

- (BOOL)dogShouldWagTail:(Dog *)dog {
    return NO;
}

@end
