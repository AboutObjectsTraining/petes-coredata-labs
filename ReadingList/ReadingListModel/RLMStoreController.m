//
//  RLMStoreController.m
//  ReadingListModel
//
//  Created by Peter Victoratos on 3/18/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import "RLMStoreController.h"
#import "RLMReadingList.h"

//takes in document name and file type
NSString *RELPathForDocument(NSString *name, NSString *type)
{
    //create an array of search paths in NSSearchPathDirectory in the domain mask given
    //bool is a tilde expander which means it gives the entire path
    
    //this domain mask is (in this case) the user's home directory. its called a mask bc it hides
    //the actual name of the directory path

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    //returns the last object in the paths array, appended by that object's file type
    return [[paths.lastObject stringByAppendingPathComponent:name] stringByAppendingPathExtension:type];
}

//the store is called ReadingList
NSString * const defaultStoreName = @"ReadingList";

@implementation RLMStoreController

- (NSString *)storeType { return @"plist"; }
- (NSString *)storeName { return defaultStoreName; }
//creates the path for the plist bundle created
- (NSString *)bundlePath { return [[NSBundle bundleForClass:self.class] pathForResource:self.storeName ofType:self.storeType]; }
//creates a ReadingList.plist full path string so that a dictionary object (created in fetchedReadingList) can use stored data
- (NSString *)storePath {
    NSString *path = RELPathForDocument(self.storeName, self.storeType);
    //lazily creates our store path
    if (![NSFileManager.defaultManager fileExistsAtPath:path]) {
        [NSFileManager.defaultManager copyItemAtPath:self.bundlePath toPath:path error:nil];
    }
    return path;
}

- (RLMReadingList *)fetchedReadingList
{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:self.storePath];
    return [RLMReadingList modelObjectWithDictionary:dict];
}

- (void)saveReadingList:(RLMReadingList *)readingList
{
    [readingList.dictionaryRepresentation writeToFile:self.storePath atomically:YES];
}

@end
