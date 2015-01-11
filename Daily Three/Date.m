//
//  Date.m
//  Daily Three
//
//  Created by Mollie on 1/10/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "Date.h"
#import "Item.h"


@implementation Date

@dynamic date;
@dynamic items;

- (NSString *)sectionName {
    NSDate *date = self.date;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM. yyyy"];
    
    return [dateFormatter stringFromDate:date];
}

@end
