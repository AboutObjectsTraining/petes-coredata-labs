//
//  RELAddBookController.h
//  ReadingList
//
//  Created by Pete Victoratos on 3/11/20.
//  Copyright © 2020 About Objects. All rights reserved.
//
#import <UIKit/UIKit.h>

@class RLMBook;

@interface RELAddBookController : UITableViewController

@property (strong, nonatomic) void (^completion)(RLMBook *book);

@end
