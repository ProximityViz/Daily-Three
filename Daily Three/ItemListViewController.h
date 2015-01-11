//
//  ItemListViewController.h
//  Daily Three
//
//  Created by Mollie on 1/10/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Date;

@interface ItemListViewController : UITableViewController

@property (nonatomic) Date *date;

@property (nonatomic) NSString *title;

@end
