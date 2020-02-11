//
//  ClassClusterTests.m
//  ExperimentsTests
//
//  Created by Peter Victoratos on 2/4/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ClassClusterTests : XCTestCase

@end

@implementation ClassClusterTests

- (void)testNSStringClassCluster{
    NSString *s1 = [NSString alloc];
    //NSString *s2 = [NSString alloc];
    s1 = [s1 initWithFormat:@"%@ %@", @"hello", @"world"];
    NSLog(@"%@", s1);
    //NSLog(@"%@", s2);
    
    NSMutableString *s3 = [NSMutableString alloc];
    s3 = [s3 initWithString:s1];
    NSLog(@"%@", s3);
}

@end
