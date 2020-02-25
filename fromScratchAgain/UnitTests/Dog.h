//
//  Dog.h
//  UnitTests
//
//  Created by Peter Victoratos on 2/18/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DogDelegate;

@interface Dog : NSObject

@property (weak, nonatomic) id<DogDelegate> delegate;
@property (copy, nonatomic) NSString *name;

- (id)initWithName:(NSString *)name;
- (void)sit;
- (void)doorbellDidRing;

@end

@protocol DogDelegate <NSObject>

- (void)dogDidHearDoorbell:(Dog *)dog;
- (BOOL)dogShouldBark:(Dog *)dog;
- (BOOL)dogShouldWagTail:(Dog *)dog;

@end
