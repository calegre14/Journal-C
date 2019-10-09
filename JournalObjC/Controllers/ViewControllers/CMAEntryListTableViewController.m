//
//  CMAEntryListTableViewController.m
//  JournalObjC
//
//  Created by Christopher Alegre on 10/8/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import "CMAEntryListTableViewController.h"
#import "CMAEntryController.h"
#import "CMAEntryDetailViewController.h"

@interface CMAEntryListTableViewController ()

@end

@implementation CMAEntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:true];
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[CMAEntryController sharedController] entries] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    CMAEntryController * entryController = [CMAEntryController sharedController];
    CMAEntry * entry = entryController.entries[indexPath.row];
    cell.textLabel.text = entry.title;
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM-dd-yyyy"];
    cell.detailTextLabel.text = [dateFormatter stringFromDate:entry.timeStamp];
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"toShowDetailVC"])
    {
        NSIndexPath * indexPath = [self.tableView indexPathForCell:sender];
        CMAEntry * entry = [CMAEntryController sharedController].entries[indexPath.row];
        CMAEntryDetailViewController * detailViewController = segue.destinationViewController;
        detailViewController.entry = entry;
    }
    
}


@end
