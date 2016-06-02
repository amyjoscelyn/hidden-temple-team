//
//  AMYTeamsTableViewController.m
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 6/1/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYTeamsTableViewController.h"
#import "AMYTeamDetailViewController.h"
#import "AMYLocalHostAPIClient.h"
#import "AMYSharedDataStore.h"

@interface AMYTeamsTableViewController ()

@property (nonatomic, strong) NSMutableArray *teams;
@property (nonatomic, strong) AMYSharedDataStore *dataStore;

@end

@implementation AMYTeamsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataStore = [AMYSharedDataStore sharedStoryDataStore];
    
    [AMYLocalHostAPIClient getInfoFromRepositoryWithQuery:@"teams/all" completion:^(NSArray *teams)
     {         
         self.teams = [teams mutableCopy];
         [self.tableView reloadData];
//         NSLog(@"teams: %@", self.teams);
     }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return self.teams.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"teamRow" forIndexPath:indexPath];
    
    NSInteger row = indexPath.row;
    cell.textLabel.text = [NSString stringWithFormat:@"team # %li", row];
    
    NSDictionary *team = self.teams[row];
    
    NSString *teamID = team[@"teamID"];
    NSString *teamName = team[@"teamName"];
    
    cell.textLabel.text = teamName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"#%@", teamID];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AMYTeamDetailViewController *teamDestinationVC = segue.destinationViewController;
    
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    NSInteger row = indexPath.row;
    
    teamDestinationVC.team = self.teams[row];
}

@end
