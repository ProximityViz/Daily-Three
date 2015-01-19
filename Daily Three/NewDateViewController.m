//
//  NewDateViewController.m
//  Daily Three
//
//  Created by Mollie on 1/10/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "NewDateViewController.h"

@interface NewDateViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation NewDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissSelf {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneWasPressed:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([self.dates count] == 0) {
        self.dates = [[NSMutableArray alloc] init];
    }
    
    // format date
    NSDate *date = self.datePicker.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE, MMMM d"];
    NSString *formattedDateString = [dateFormatter stringFromDate:date];
    
    // add date and its 3 items to data
    NSDictionary *dateData = @{
       @"unformattedDate": date,
       @"date": formattedDateString,
       @"items": @[ @{
                        @"title": @"Item 1",
                        @"detail": @"detail text"
                    },
                    @{
                        @"title": @"Item 2",
                        @"detail": @"detail text"
                    },
                    @{
                        @"title": @"Item 3",
                        @"detail": @"detail text"
                    }
                    ]
                           };
    
    // there's probably a better way to do this

    BOOL dateExists = NO; // initializing
    for (NSDictionary *dictionary in self.dates) {
        if ([dictionary[@"date"] isEqualToString:formattedDateString]) {
            dateExists = YES;
            NSString *title = [NSString stringWithFormat:@"That date already has a to-do list"];
            UIAlertView *alertViewDraw = [[UIAlertView alloc] initWithTitle:title message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
            [alertViewDraw show];
            return;
        }
    }
    
    if (dateExists == NO) {
        [self.dates addObject:dateData];
    }
    
    // sort
    NSSortDescriptor *unformattedDateDescriptor = [[NSSortDescriptor alloc] initWithKey:@"unformattedDate" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObject:unformattedDateDescriptor];
    self.dates = [[self.dates sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
    
    
    [defaults setObject:self.dates forKey:@"dates"];
    
    
    [self dismissSelf];
}

- (IBAction)cancelWasPressed:(id)sender {
    [self dismissSelf];
}

@end
