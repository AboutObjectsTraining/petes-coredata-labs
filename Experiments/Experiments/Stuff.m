//
//  Stuff.m
//  Experiments
//
//  Created by Peter Victoratos on 2/3/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stuff.h"

Percentage calculateDiscount(float price, float discountAmount)
{
    return (discountAmount/price) * 100;
}
