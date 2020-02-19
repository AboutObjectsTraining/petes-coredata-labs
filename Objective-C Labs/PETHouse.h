//
//  PETHouse.h
//  UnitTests
//
//  Created by Peter Victoratos on 2/13/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface PETHouse : NSObject

@property (nonatomic) int addressNumber;
@property (copy, nonatomic) NSString *streetName;
@property (copy, nonatomic) NSString *streetType;

@property (readonly, nonatomic) Person *houseOwner;

- (id)initWithHouseInformation:(NSString *)streetName
                    streetType:(NSString *)streetType
                 addressNumber:(int)addressNumber
                         owner:(Person *)houseOwner;

+ (instancetype)houseWithInformation:(NSString *)streetName
                          streetType:(NSString *)streetType
                       addressNumber:(int)addressNumber
                               owner:(Person *)houseOwner;



// TODO: - connect doorbell method, 
@end

