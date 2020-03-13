//
//  RELReadingListController.h
//  ReadingList
//
//  Created by Pete Victoratos on 3/9/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RELSampleBook;

@interface RELReadingListController : UITableViewController
@property(nonatomic, retain) RELSampleBook *sampleBook;
@end

@interface OLDReadingListController : UITableViewController
@property(nonatomic, retain) RELSampleBook *sampleBook;
@end

@interface OLDERReadingListController : UITableViewController
@property(nonatomic, retain) RELSampleBook *sampleBook;
@end

