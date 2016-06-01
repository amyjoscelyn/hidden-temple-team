//
//  AMYTeamsTableViewController.m
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 6/1/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYTeamsTableViewController.h"
#import "AMYLocalHostAPIClient.h"
#import "AMYSharedDataStore.h"

@interface AMYTeamsTableViewController ()

@property (nonatomic, strong) NSMutableArray *teams;
@property (nonatomic, strong) AMYSharedDataStore *dataStore;

@end

@implementation AMYTeamsTableViewController

- (void)viewDidLoad
{
    /*
     =======================================================
           THIS HAS NOT YET BEEN TESTED WITH LIVE DATA
     =======================================================
     */
    [super viewDidLoad];
    
    self.dataStore = [AMYSharedDataStore sharedStoryDataStore];
    
    [AMYLocalHostAPIClient getInfoFromRepositoryWithQuery:@"teams/all" completion:^(NSArray *players)
     {         
         self.teams = [players mutableCopy];
         [self.tableView reloadData];
         NSLog(@"teams: %@", self.teams);
     }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
    //    return self.players.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"teamRow" forIndexPath:indexPath];
    
    NSInteger row = indexPath.row;
    cell.textLabel.text = [NSString stringWithFormat:@"team # %li", row];
    
    /*
     =======================================================
     THIS HAS NOT YET BEEN TESTED WITH LIVE DATA
     =======================================================
     *-/
    
    NSDictionary *team = self.teams[row];
    
    NSString *teamID = team[@"teamID"];
    NSString *teamName = team[@"teamName"];
    
    cell.textLabel.text = teamName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"#%@", teamID];
    
    */
    
    return cell;
}

/*
 =======================================================
 THIS HAS NOT YET BEEN TESTED WITH LIVE DATA
 =======================================================
 *-/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AMYPlayerDetailViewController *playerDestinationVC = segue.destinationViewController;
    
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    NSInteger row = indexPath.row;
    
    playerDestinationVC.player = self.players[row];
    //    [playerDestinationVC setPlayer:self.players[row]];
}
*/
@end
