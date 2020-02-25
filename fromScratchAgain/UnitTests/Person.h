//
//  Person.h
//  UnitTests
//
//  Created by Peter Victoratos on 2/18/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *lastName;
@property (assign, nonatomic) NSUInteger age;

@property (readonly, nonatomic) NSString *fullName;

- (id)initWithFirstName:(NSString *)firstName
              lastName:(NSString *)lastName
                   age:(NSUInteger)age;

-(void)display;

+ (instancetype)personWithFirstName:(NSString *)firstName
                          lastName:(NSString *)lastName
                               age:(NSUInteger)age;

@property (assign, nonatomic) NSUInteger rating;
@property (readonly, nonatomic) NSString *ratingStars;

@end

