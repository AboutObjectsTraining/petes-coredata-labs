//
//  ManagedObjectModelTests.m
//  eBooksModelTests
//
//  Created by Peter Victoratos on 1/27/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CoreData/CoreData.h>

@import eBooksModel;

@interface ManagedObjectModelTests : XCTestCase
@property (copy, nonatomic) NSURL *modelURL;
@property (strong, nonatomic) NSManagedObjectModel *model;
@end

@implementation ManagedObjectModelTests

- (void)setUp {
    NSBundle *bundle = [NSBundle bundleForClass:ManagedObject.class];
    NSString *path = [bundle pathForResource:@"eBooks" ofType:@"momd"];
    self.modelURL = [[NSURL alloc] initFileURLWithPath:path];
}

- (void)testCStuff {
    
    int x = 3, *y = &x, **z = &y;
    printf("%d, %p, %p\n", x, y, z);
}

- (void)testBundlePath {
    NSLog(@"%@", NSBundle.mainBundle);
    NSLog(@"%@", [NSBundle bundleForClass:ManagedObject.class]);
    
    NSBundle *bundle = [NSBundle bundleForClass:ManagedObject.class];
    NSString *path = [bundle pathForResource:@"eBooks" ofType:@"momd"];
    NSLog(@"%@", path);
}

- (void)testLoadModel {
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:self.modelURL];
    NSLog(@"%@", model);
}

@end

// URL :
// initWithPath
//

//- (instancetype)init NS_DESIGNATED_INITIALIZER;
//- (nullable instancetype)initWithContentsOfURL : (NSURL *)url;



//What do I need to create an instance of NSManagedObjectModel?
//      I need mergedModelFromBundles which merges all specified bundles
//      I also need modelByMergingModels which combines them all
//      init method [relies on initWithContentsOfURL]
// pretty sure the file we need is eBooks4.xcdatamodeld

//cmd shift o is Quick Search
//use nsbundle to find the path of the model to init it NSBundle API
//get URL // print it then

//@interface NSManagedObjectModel : NSObject {
//}
//
//+ (nullable NSManagedObjectModel *)mergedModelFromBundles:(nullable NSArray<NSBundle *> *)bundles;
//+ (nullable NSManagedObjectModel *)modelByMergingModels:(nullable NSArray<NSManagedObjectModel *> *)models;
