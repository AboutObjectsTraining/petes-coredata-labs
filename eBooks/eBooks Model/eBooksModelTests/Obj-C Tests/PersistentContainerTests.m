//
//  PersistentContainerTests.m
//  eBooksModelTests
//
//  Created by Peter Victoratos on 1/29/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CoreData/CoreData.h>

@import eBooksModel;

@interface PersistentContainerTests : XCTestCase
@property (strong, nonatomic) NSManagedObjectModel *model;
@property (strong, nonatomic) NSPersistentContainer *container;

@end

@implementation PersistentContainerTests

- (void) setUp {
    //Gathers the bundle URL and creates an instance of the model
    NSBundle *bundle = [NSBundle bundleForClass:ManagedObject.class];
    NSURL *modelURL = [bundle URLForResource:@"eBooks" withExtension:@"momd"];
    self.model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    self.container = [[NSPersistentContainer alloc] initWithName:@"EBooksTest" managedObjectModel:self.model];
    [self.container loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *info, NSError *error) {    }];
}

// Test to ensure that Container's default directory URL ends with 'Application Support'
- (void) testVerifyDefaultDirectory {
    NSString *defaultURLEnd = NSPersistentContainer.defaultDirectoryURL.lastPathComponent;
    NSString *appSupport = @"Application Support";
    
    printf("%s", defaultURLEnd.UTF8String);
    printf(" =? ");
    printf("%s", appSupport.UTF8String);
    
    if ([defaultURLEnd isEqualToString:appSupport])
        printf("\nPassed!\n");
    else
        printf("\nFailed!\n");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
