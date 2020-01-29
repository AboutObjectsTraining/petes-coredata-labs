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

static NSString * const pathURLString = @"/Users/pvictoratos/Documents/GitHub/advanced-ios/Projects/eBooks/eBooks Model/eBooksModel/eBooks.xcdatamodeld";

@interface ManagedObjectModelTests : XCTestCase
@property (strong, nonatomic)NSManagedObjectModel *model;
@property (weak, nonatomic)NSAttributeDescription *attribute;
@property (copy, nonatomic) NSURL *modelURL;
@property (copy, nonatomic) NSString *path;
@end

@implementation ManagedObjectModelTests

- (void)setUp {
    //make the easy things simple and the hard things possible
    
    //mixture of the below code wrapped within a setUp method
    NSBundle *bundle = [NSBundle bundleForClass:ManagedObject.class];
    NSString *path = [bundle pathForResource:@"eBooks" ofType:@"momd"];
    self.modelURL = [[NSURL alloc] initFileURLWithPath:path];
}

- (void)testStuff {
    //testing some c code
    int x = 3, *y = &x, **z = &y;
    printf("\n");
    printf("%d, %p, %p\n", x, y, z);
}

- (void)testBundlePath{
    //gets app directory bundle on whatever system you run the app on
    //NSLog(@"%@", NSBundle.mainBundle);
    //gets bundle directory of the testing framework
    //NSLog(@"%@", [NSBundle bundleForClass:ManagedObject.class]);
    
    // getting main bundle in its current location to get the path for the instance of it
    NSBundle *bundle = [NSBundle bundleForClass:ManagedObject.class];
    NSString *path = [bundle pathForResource:@"eBooks" ofType:@"momd"];
    NSLog(@"%@", path);
}

- (void)testLoadModel {
    //Loads & populates model with frameowrk target's bundle
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:self.modelURL];
    NSLog(@"%@", model);
}

- (void)testEntityDescriptionsLoop {
    //Loops through & organizes the different attributes of the bundle
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:self.modelURL];
    
    for (NSEntityDescription *entity in model.entities) {
        //What's the most basic way to do this?
        //Print out one line at a time
        
        for (NSPropertyDescription *property in entity){
            NSLog(@"Properties by name: %@", property);
        }
        //should print out Entity: [entity name] ________________
        //another loop should print out attributes by name using key, attribute pair

        //last loop should print out relationsihps by name

    }
}

- (void)testEntityNameFormat {
    //NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:self.modelURL];
    //NSLog(NSString * _Nonnull format, ...);


}

- (void)testEntityBookNameGet{
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:self.modelURL];
    for (NSEntityDescription *entity in model.entities) {
        //What's the most basic way to do this?
        //Print out one line at a time
        printf("\n");
        NSLog(@"Entities by name: %@", entity.name);
        printf("\n");
        for (NSPropertyDescription *attribute in entity.attributesByName){
            NSLog(@"Attributes by name: %@", attribute);
        }
        printf("\n");
        for (NSRelationshipDescription *relationship in entity.relationshipsByName){
            NSLog(@"Relationships by name: %@", relationship);
        }

//    NSPropertyDescription *attribute = [[NSPropertyDescription alloc] description : self.name];
    //im supposed to create a model of the entities and go into their containers and grab the name?

}
    printf("\n");
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


//cmd shift o is Quick Search
//use nsbundle to find the path of the model to init it NSBundle API
//get URL // print it then

