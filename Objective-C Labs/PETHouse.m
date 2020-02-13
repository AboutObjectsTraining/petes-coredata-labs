//
//  PETHouse.m
//  UnitTests
//
//  Created by Peter Victoratos on 2/13/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

//Rewriting what got nuked last night after xcode crashed on me a couple of times :/
//I just had the .h file done for PETHouse and a bunch of notes but I remember what I wanted from it:

//the premise of these house classes is to create a class that can hold persons, dogs and dog owners
//it would be really cool to tie this into the initial c programming lessons so that the entirety of this
//course flows together. Comparing memory allocation to getting a plot of land (allocating memory), planning
//a house (blueprints [.h or interface]), building a foundation [init], etc.

//I have two ideas on how the addresses of houses will be implemented
// 1. Normal house addresses with a house number, street type and name. Each house will be an arbitrary distance from
//      other houses in miles & cardinal direction, this can be tracked in a dictionary or map
// 2. House objects have memory addresses, so why not use them as the addresses? Location differences will be found
//      by taking a delta of the memory addresses. We will build a small community in memory!

//Also in this implementation:

// A didDoorBellRing should be tied into house, still has affect on dog
// A house can return its street name, house name and full street address
// A person can ask for directions from there house to another person's house
// 1. Normal addresses will have something like "Oh yes my house is 2.5 miles east from here"
// 2. Memory addresses will show a difference in bytes, over a certain amount a person will say "Holy smokes that's far away!"
// A person's last name will be used for the houses' "House Name" [The Jones']
// A dog will have a breed. Persons can ask for the dog's breed (like Borat)
//

#import "PETHouse.h"

@implementation PETHouse

@end
