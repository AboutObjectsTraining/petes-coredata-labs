// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

@interface BlockLiteralTests : XCTestCase
@property (copy, nonatomic) NSString *text;
@end

void sayHello(void) {
    printf("Hello!\n");
}

void saySomething(void (*thingToSay)(void)) {
    for (int i = 0; i < 3; i++) {
        thingToSay();
    }
}

void saySomethingBlockish(void (^blockToExecute)(void)) {
    for (int i = 0; i < 3; i++) {
        blockToExecute();
    }
}

void saySomethingBlockishWithCount(void (^blockToExecute)(int)) {
    for (int i = 0; i < 3; i++) {
        blockToExecute(i);
    }
}

//(void (^)(void)) giveMeABlock(void) {
//    for (int i = 0; i < 3; i++) {
//        blockToExecute(i);
//    }
//}


@implementation BlockLiteralTests

- (void)setUp {
    self.text = @"Woohoo!";
}

- (void)testBlockLiteralArgument {
    saySomethingBlockish(^{
        printf("Hello from my block!\n");
    });
    
    saySomethingBlockishWithCount(^(int count){
        printf("%d: Hello from my block!\n", count);
    });
}

- (void)testCapturingLocalState {
    int x = 42;
    saySomethingBlockish(^{
        NSLog(@"Hello from my block, %@, %d!\n", self.text, x);
    });
}

- (void)testFunctionPointer {
    void (*myPtr)(void);
    
    printf("%p\n", sayHello);
    myPtr = sayHello;
    
    myPtr();
}

- (void)testFunctionPointerArgument {
    saySomething(sayHello);
}

- (void)testBlockLiteral {
    void (^myBlock)(void);
    
    int foo = 42;
    myBlock = ^{
        printf("Hello from my block %d!\n", foo);
    };
    
    myBlock();
    
    void (^copyOfMyBlock)(void) = [myBlock copy];
    
    copyOfMyBlock();
}

@end
