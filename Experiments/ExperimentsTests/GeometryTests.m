//
//  GeometryTests.m
//  ExperimentsTests
//
//  Created by Peter Victoratos on 2/3/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Experiments/Experiments.h>

@interface GeometryTests : XCTestCase
@end

@implementation GeometryTests

- (void)testSizeStruct {
    CDXSize mySize = newSize(12, 24);
    show(mySize);
    
    CDXSize offsetSize = offset(mySize, 6, 12);
    show(offsetSize);
}

- (void)testArrayOfSizes {
    CDXSize sizes[3] = { newSize(3,4), newSize(12,18), newSize(100,100) };
    
    for (int i = 0; i < 3; i++) {
        show(sizes[i]);
    }
}

@end
