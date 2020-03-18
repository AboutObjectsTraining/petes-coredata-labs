//
//  RLMStoreController.h
//  ReadingListModel
//
//  Created by Peter Victoratos on 3/18/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString *RELPathForDocument(NSString *name, NSString *type);

@class RLMReadingList;

@interface RLMStoreController : NSObject

@property (nonatomic, readonly) RLMReadingList *fetchedReadingList;

- (void)saveReadingList:(RLMReadingList *)readingList;

@end
