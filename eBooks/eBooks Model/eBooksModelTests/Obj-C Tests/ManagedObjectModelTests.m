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
@property (strong, nonatomic) NSManagedObjectModel *model;

@end

@implementation ManagedObjectModelTests

- (void) setUp {
    //Gathers the bundle URL and creates an instance of the model
    NSBundle *bundle = [NSBundle bundleForClass:ManagedObject.class];
    NSURL *modelURL = [bundle URLForResource:@"eBooks" withExtension:@"momd"];
    self.model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
}

- (void) testStuff {
    //testing some c code
    int x = 3, *y = &x, **z = &y;
    printf("\n");
    printf("%d, %p, %p\n", x, y, z);
}

- (void) testBundlePath {
    //gets app directory bundle on whatever system you run the app on
        //NSLog(@"%@", NSBundle.mainBundle);
    //gets bundle directory of the testing framework
        //NSLog(@"%@", [NSBundle bundleForClass:ManagedObject.class]);
    
    // getting main bundle in its current location to get the path for the instance of it
    NSBundle *bundle = [NSBundle bundleForClass:ManagedObject.class];
    NSString *path = [bundle pathForResource:@"eBooks" ofType:@"momd"];
    NSLog(@"Path is %@. Cool.", path);
}

- (void)testLoadModel {
    //Loads & populates model with frameowrk target's bundle
    NSLog(@"%@", self.model);
}

- (void) testEntityDescriptionFormat {
    for (NSEntityDescription *entity in self.model.entities) {
        printf("\n Entity: %s"
               "\n --------------------"
               "\n Class name: %s"
               "\n\tAttributes: "
               ,
               entity.name.UTF8String,
               entity.managedObjectClassName.UTF8String);
        for (NSPropertyDescription *attribute in entity) {
            printf("\t\t %s", attribute.name.UTF8String);
        }
        printf("\n\tRelationships: ");
        for (NSRelationshipDescription *relationship in entity.relationshipsByName) {
            printf("\t\t %s", relationship.description.UTF8String);
        }
        printf("\n");
    }
    printf("\n");
}

- (void) testEntityDescriptions {
    //Loops through & organizes the different attributes of the bundle
    for (NSEntityDescription *entity in self.model.entities) {
        NSLog(@"Entities by name: %@", entity.name);
        printf("\n");
        for (NSPropertyDescription *attribute in entity.propertiesByName) {
            NSLog(@"Attributes by name: %@", attribute);
        }
        printf("\n");
        for (NSRelationshipDescription *relationship in entity.relationshipsByName) {
            NSLog(@"Relationships by name: %@", relationship);
        }
    }
    printf("\n");
}
@end
