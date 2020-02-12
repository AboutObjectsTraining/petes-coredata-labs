//
//  Dog.h
//  UnitTests
//
//  Created by Peter Victoratos on 2/11/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <Foundation/Foundation.h>

//does the order of these declarations matter?
@class Dog;

@protocol DogDelegate <NSObject>

- (void)dogDidHearDoorbell:(Dog *)dog;
- (BOOL)dogShouldBark:(Dog *)dog;
- (BOOL)dogShouldWagTail:(Dog *)dog;

@end
@interface Dog : NSObject
{
    //instance variable declaration
    NSString *_name;
    id<DogDelegate> _delegate;
}

- (id<DogDelegate>)delegate;
- (void)setDelegate:(id<DogDelegate>)delegate;

- (void)sit;



//custom initializer
- (id)initWithName:(NSString *)name;
//name accessor method
- (NSString *)name;

- (void)doorbellDidRing;

@end
