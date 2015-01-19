//
//  NewItemViewController.m
//  Daily Three
//
//  Created by Mollie on 1/10/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "EditItemViewController.h"

@interface EditItemViewController ()

@property (weak, nonatomic) IBOutlet UITextField *itemTitle;
@property (weak, nonatomic) IBOutlet UITextView *itemDetail;


@end

@implementation EditItemViewController

- (void)viewWillAppear:(BOOL)animated {
    NSDictionary *item = self.selectedDate[@"items"][self.selectedItem];
    
    self.itemTitle.text = item[@"title"];
    self.itemDetail.text = item[@"detail"];
    
    [self.itemDetail.layer setBorderWidth:1];
    [self.itemDetail.layer setCornerRadius:4];
    [self.itemDetail.layer setBorderColor:[[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1] CGColor]];
//    self.itemDetail.textColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    
//    self.dates = [[defaults arrayForKey:@"dates"] mutableCopy];
    
}

- (void)viewDidAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissSelf {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneWasPressed:(id)sender {
    
    // there's probably a better way to do this:
    for (NSDictionary *date in self.dates) {
        if ([date[@"date"] isEqualToString:self.selectedDate[@"date"]]) {
            date[@"items"][self.selectedItem][@"title"] = self.itemTitle.text;
            date[@"items"][self.selectedItem][@"detail"] = self.itemDetail.text;
        }
    }
    
    //store data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.dates forKey:@"dates"];
    
    [self dismissSelf];
    
}

- (IBAction)cancelWasPressed:(id)sender {
    [self dismissSelf];
}

@end
