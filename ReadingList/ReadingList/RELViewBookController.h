//
//  RELViewController.h
//  ReadingList
//
//  Created by Pete Victoratos on 3/9/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RLMBook;

@interface RELViewBookController : UITableViewController

@property (strong, nonatomic) RLMBook *book;

@end

