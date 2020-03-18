//
//  RLMStoreController.m
//  ReadingListModel
//
//  Created by Peter Victoratos on 3/18/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import "RLMStoreController.h"
#import "RLMReadingList.h"

NSString *RELPathForDocument(NSString *name, NSString *type)
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[paths.lastObject stringByAppendingPathComponent:name] stringByAppendingPathExtension:type];
}


NSString * const defaultStoreName = @"ReadingList";

@implementation RLMStoreController

- (NSString *)storeType { return @"plist"; }
- (NSString *)storeName { return defaultStoreName; }
- (NSString *)bundlePath { return [[NSBundle bundleForClass:self.class] pathForResource:self.storeName ofType:self.storeType]; }
- (NSString *)storePath {
    NSString *path = RELPathForDocument(self.storeName, self.storeType);
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
