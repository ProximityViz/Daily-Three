//
//  NewDateViewController.m
//  Daily Three
//
//  Created by Mollie on 1/10/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "NewDateViewController.h"
#import "Date.h"
#import "CoreDataStack.h"

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dismissSelf {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)insertDate {
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    Date *date = [NSEntityDescription insertNewObjectForEntityForName:@"Date" inManagedObjectContext:coreDataStack.managedObjectContext];
    date.date = self.datePicker.date;
    
    [coreDataStack saveContext];
}

- (IBAction)doneWasPressed:(id)sender {
    [self insertDate];
    [self dismissSelf];
}

- (IBAction)cancelWasPressed:(id)sender {
    [self dismissSelf];
}

@end
