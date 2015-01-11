//
//  Item.h
//  Daily Three
//
//  Created by Mollie on 1/10/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ENUM(int16_t, ItemOrder) {
    ItemOrderFirst = 0,
    ItemOrderSecond = 1,
    ItemOrderThird = 2
};


@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * detail;
@property (nonatomic) BOOL done;
@property (nonatomic) int16_t order;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSManagedObject *date;

@end
