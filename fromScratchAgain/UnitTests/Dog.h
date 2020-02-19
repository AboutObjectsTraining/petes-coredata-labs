//
//  Dog.h
//  UnitTests
//
//  Created by Peter Victoratos on 2/18/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Dog;

@protocol DogDelegate <NSObject>

- (void)dogDidHearDoorbell:(Dog *)dog;
- (BOOL)dogShouldBark:(Dog *)dog;
- (BOOL)dogShouldWagTail:(Dog *)dog;

@end
@interface Dog : NSObject
{
    id<DogDelegate> _delegate;
}

@property (copy, nonatomic) NSString *name;
- (void)sit;

- (id)initWithName:(NSString *)name;

- (void)doorbellDidRing;

- (id<DogDelegate>)delegate;
- (void)setDelegate:(id<DogDelegate>)delegate;

@end
