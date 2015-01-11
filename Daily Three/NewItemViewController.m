//
//  NewItemViewController.m
//  Daily Three
//
//  Created by Mollie on 1/10/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "NewItemViewController.h"
#import "Item.h"
#import "Date.h"
#import "CoreDataStack.h"

@interface NewItemViewController ()

@property (weak, nonatomic) IBOutlet UITextField *itemTitle;
@property (weak, nonatomic) IBOutlet UITextView *itemDetail;


@end

@implementation NewItemViewController

- (void)viewWillAppear:(BOOL)animated {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.item != nil) {
        self.itemTitle.text = self.item.title;
        self.itemDetail.text = self.item.detail;
    }
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

- (void)insertItem {
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    Item *item = [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:coreDataStack.managedObjectContext];
    item.title = self.itemTitle.text;
    item.detail = self.itemDetail.text;
    
    item.date = self.date;
    
    [coreDataStack saveContext];
}

- (void)updateItem {
    self.item.title = self.itemTitle.text;
    self.item.detail = self.itemDetail.text;
    
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    [coreDataStack saveContext];
}

- (IBAction)doneWasPressed:(id)sender {
    if (self.item.title != nil) {
        [self updateItem];
    } else {
        [self insertItem];
    }
    [self dismissSelf];
}

- (IBAction)cancelWasPressed:(id)sender {
    [self dismissSelf];
}

@end
