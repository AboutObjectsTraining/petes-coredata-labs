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
@property (assign, nonatomic) int age;

@property (readonly, nonatomic) NSString *fullName;

- (id)initWithFullName:(NSString *)firstName
              lastName:(NSString *)lastName
                   age:(int)age;

-(void)display;

+ (instancetype)personWithFullName:(NSString *)firstName
                          lastName:(NSString *)lastName
                               age:(int)age;

@property (assign, nonatomic) NSUInteger rating;
@property (readonly, nonatomic) NSString *ratingStars;

@end

