//
//  Date.h
//  Daily Three
//
//  Created by Mollie on 1/10/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Item;

@interface Date : NSManagedObject

@property (nonatomic) NSDate *date;
@property (nonatomic, retain) NSOrderedSet *items;

@property (nonatomic, readonly) NSString *sectionName;

@end

@interface Date (CoreDataGeneratedAccessors)

- (void)insertObject:(Item *)value inItemsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromItemsAtIndex:(NSUInteger)idx;
- (void)insertItems:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeItemsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInItemsAtIndex:(NSUInteger)idx withObject:(Item *)value;
- (void)replaceItemsAtIndexes:(NSIndexSet *)indexes withItems:(NSArray *)values;
- (void)addItemsObject:(Item *)value;
- (void)removeItemsObject:(Item *)value;
- (void)addItems:(NSOrderedSet *)values;
- (void)removeItems:(NSOrderedSet *)values;
@end
