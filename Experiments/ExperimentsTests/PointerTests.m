//
//  PointerTests.m
//  ExperimentsTests
//
//  Created by Peter Victoratos on 2/3/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface PointerTests : XCTestCase

@end

@implementation PointerTests

- (void)testArrayOfChar {
    //these braces are called a static initializer list
    char letters[10] = {97, 98, 99, 0};
    for (int i = 0; i < 10; i++) {
        //0 isn't actually 0, its a null character
        printf("address: %p, value: %d, char value: %c\n", &letters[i], letters[i], letters[i]);
    }
    
    printf("%s\n", letters);
    
    char letters2[10] = {'a', 'b', 'c', '\0'};
    printf("%s\n", letters2);
    
    char letters3[10] = "abc";
    printf("%s\n", letters3);
    
    char letters4[] = "abc";
    
    //because the literal string has been defined, these p1 and p2 variables are just references to the
    //previously declared instance
    char *p1 = "abc";
    printf("%s\n", p1);
    
    letters3[0] = 'A';
    printf("%s\n", letters3);
    printf("%s\n", letters4);
    
//    you tried to write in the read-only memory, throws an error
//    p1[0] = 'Z';
//    printf("%s\n", p1);

}

- (void)testPointerToInt {
    //int y = 42;
    int x = 3;
    int *myPointer;
    
    myPointer = &x;
    NSLog(@"address is: %p, value is %d", myPointer, *myPointer);
    
    //dereference the pointer
    *myPointer += 1;
    myPointer += 1;
    NSLog(@"address is: %p, value is %d", myPointer, *myPointer);
}

- (void)testPointerToArrayOfInt {
    //empty initializer list inits all values to 0
    //-1 is a 'sentinel value' which denotes a condition of termination
    int numbers[] = {1,2,3, -1};
    
    //this doesn't work because numbers2 is symbol, not a variable
    //  int numbers2[] = numbers;
    
    NSLog(@"address is %p, value is %d", numbers, numbers[0]);
    
    for (int i = 0; i < 5; i++){
        printf("%d\n", numbers[i]);
    }
    
    //holds the address of an int
    int *numberRef = numbers;
    printf("Value of numberRef is %p, value is %d\n", numberRef, *numberRef);
    printf("Value of numberRef is %p, value is %d\n", numbers, numbers[0]);
    printf("\n");
    printf("numberRef is %p, value is %d\n", numberRef + 1, *(numberRef + 1));
    printf("numberRef is %p, value is %d\n", numberRef + 1, numberRef[1]);
    printf("numberRef is %p, value is %d\n", numbers + 1, *(numbers + 1));
    printf("\n");
    
    //until pointer points to -1
    for (int *p = numberRef; *p != -1; p++){
        printf("p is %p, value is %d\n", p, *p);
    }
    
    printf("\n");
}

@end
