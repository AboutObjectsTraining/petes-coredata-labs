//
//  BlockLiteralTests.m
//  ExperimentsTests
//
//  Created by Peter Victoratos on 2/7/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface BlockLiteralTests: XCTestCase
@property (copy, nonatomic) NSString *weather;
@end

void sayHello(void) {
    printf("Hello!\n");
}

void sayGoodbye() {
    printf("Goodbye!\n");
}

void runMyBlock(void (^block)(void)){
    NSLog(@"Running your block!");
    block();
}

void saySomethingForMe(void (*someFunctionPointer)(void)) {
    printf("I'm saying something for you!\n");
    someFunctionPointer();
}

@implementation BlockLiteralTests

//the block literal holds the temperature variable even though it gets
//called above in "runmyblock" bc the block structure will copy any
//additional variables added to a function call so it can use them

//in the case of self.weather, it captures a state of self

//we need to make a weak reference so that no retain cycles occur
- (void)testPassingABlockLiteral {
    self.weather = @"Sunny";
    double temperature = 69.3;
    
    void (^myBlock)(void) = ^{
        NSLog(@"It is HOT in Topeka! Today it is %@ and this hot: %.1f", self.weather, temperature);
    };
    
    runMyBlock(myBlock);
    
    void (^copiedBlock)(void) = [myBlock copy];
    copiedBlock();
}

- (void)testBlockLiterals {
    void (^myBlockPointer)(void);
    
    myBlockPointer = ^{
        NSLog(@"Hello! 👋🏽");
    };
    
    myBlockPointer();
}

- (void)testFunctionPointer{
    sayHello();
    
//    int a[] = {1, 2, 3};
//
//    int *p =a;

    //pointer to void
    void (*myPointer)(void);
    myPointer = sayHello;
    myPointer();
    
    saySomethingForMe(sayHello);
    saySomethingForMe(myPointer);
    
    myPointer = sayGoodbye;
    saySomethingForMe(myPointer);
    
}

@end
