//
//  DogOwner.h
//  UnitTests
//
//  Created by Peter Victoratos on 2/18/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

@interface DogOwner : Person <DogDelegate>

-(void)addDogs:(NSArray *)newDogs;

@end
