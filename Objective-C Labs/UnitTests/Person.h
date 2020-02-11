//
//  Person.h
//  Objective-C Labs
//
//  Created by Peter Victoratos on 2/10/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    // -- Why do we need these here?
    NSString *_firstName;
    NSString *_lastName;
    int _age;
    //to serve as pointers to the private members of a Person class
    
    NSUInteger _favoritesRanking;
}

// -- What is this?
- (id)initWithFullName:(NSString *)firstName
               lastName:(NSString *)lastName
                    age:(int)age;
//a data type of an object identifier
//in this case it is a Person, and we are redefining
//its members to initialize themselves

+ (instancetype)personWithFullName:(NSString *)firstName
                        lastName:(NSString *)lastName
                                age:(int)age;

- (void)display;

- (NSString *)fullName;

- (NSString *)firstName;
- (void)setFirstName:(NSString *)newValue;

- (NSString *)lastName;
- (void)setLastName:(NSString *)newValue;

- (int)age;
- (void)setAge:(int)newValue;

- (NSUInteger)favoritesRanking;
- (void)setFavoritesRanking:(NSUInteger)newValue;

- (NSString *)favoritesRankingStars;

@end
