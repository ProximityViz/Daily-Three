//
//  NewItemViewController.h
//  Daily Three
//
//  Created by Mollie on 1/10/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item;
@class Date;

@interface NewItemViewController : UIViewController

@property (nonatomic, strong) Item *item;
@property (nonatomic, strong) Date *date;

@end
