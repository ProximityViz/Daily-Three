//
//  ItemListViewController.m
//  Daily Three
//
//  Created by Mollie on 1/10/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "ItemListViewController.h"
#import "EditItemViewController.h"

@interface ItemListViewController ()

@end

@implementation ItemListViewController

- (void)viewWillAppear:(BOOL)animated {
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    
//    self.dates = [[defaults arrayForKey:@"dates"] mutableCopy];
//    
    [self.tableView reloadData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    self.tableView.rowHeight = (self.view.frame.size.height - 64) / 3;
    
    
    NSDictionary *item = self.selectedDate[@"items"][indexPath.row];
    cell.textLabel.text = item[@"title"];
    cell.detailTextLabel.text = item[@"detail"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}

//#pragma mark - Delete item
//
//- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return UITableViewCellEditingStyleDelete;
//}
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    
//}

# pragma mark - Remove separator inset

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Remove separator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - Navigation

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"editItem"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        EditItemViewController *editItemVC = (EditItemViewController *) navigationController.topViewController;
        editItemVC.dates = self.dates;
        editItemVC.selectedDate = self.selectedDate;
        if([sender isKindOfClass:[UITableViewCell class]]) {
            NSIndexPath * indexPath = [self.tableView indexPathForCell:sender];
            editItemVC.selectedItem = (int) indexPath.row;
        }
        
    }
}

@end
