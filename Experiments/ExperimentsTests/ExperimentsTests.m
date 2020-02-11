//
//  ExperimentsTests.m
//  ExperimentsTests
//
//  Created by Peter Victoratos on 2/3/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Experiments/Experiments.h>

//Percentage calculateDiscount(float price, float discountAmount)
//{
//    return (discountAmount/price) * 100;
//}

@interface ExperimentsTests : XCTestCase

@end

@implementation ExperimentsTests

- (void) testFooBar {
    NSLog(@"%s", FOO_BAR);
    //XCTAssert(1==2);
}

- (void) testDiscount {
    Percentage p = calculateDiscount(120, 30);
    NSLog(@"%.2f", p);
}
@end
