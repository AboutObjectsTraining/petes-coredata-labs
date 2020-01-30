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
    
    //    printf("%s", defaultURLEnd.UTF8String);
    //    printf(" =? ");
    //    printf("%s", appSupport.UTF8String);
    
    //how to use XTCAssertEquals?
    
    if ([defaultURLEnd isEqualToString:appSupport])
        printf("\nPassed! Default URL ends with 'Application Support'\n");
    else
        printf("\nFailed!\n");
}

// Verify that the persistent store instance URL ends with the store name you provided, and its type is SQLite
- (void) testVerifyStoreURLType {
    //    let storeCoordinator = container.persistentStoreCoordinator
    
    NSPersistentStoreCoordinator *coordinator = self.container.persistentStoreCoordinator;
    NSPersistentStore *store = coordinator.persistentStores.firstObject;
    NSURL *name = store.URL.standardizedURL;
    NSLog(@"%@", name);
    //XCTAssertEqual(name, storeName);
    //    XCTAssertEqual(store.type, "SQLite")
}

// Verify that the container's managed object model is the same that initialized the container
- (void) testModel {
    NSManagedObjectModel *modelFromContainer = self.container.persistentStoreCoordinator.managedObjectModel;
    XCTAssertEqual(modelFromContainer, self.model);
}

// Verify that the container's viewContext property has an MOC with concurrency type of .mainQueueConcurrencyType
- (void) testContext {
    XCTAssertEqual(self.container.viewContext.concurrencyType, NSMainQueueConcurrencyType);
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
