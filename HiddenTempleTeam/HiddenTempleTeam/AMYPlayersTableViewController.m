//
//  AMYPlayersTableViewController.m
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 5/26/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYPlayersTableViewController.h"
#import "AMYPlayerDetailViewController.h"
#import "AMYLocalHostAPIClient.h"
#import "AMYSharedDataStore.h"

@interface AMYPlayersTableViewController ()

@property (nonatomic, strong) NSMutableArray *players;
@property (nonatomic, strong) AMYSharedDataStore *dataStore;

@end

@implementation AMYPlayersTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataStore = [AMYSharedDataStore sharedStoryDataStore];
    
    [AMYLocalHostAPIClient getInfoFromRepositoryWithQuery:@"players/all" completion:^(NSArray *players)
     {
         //        NSSortDescriptor *sortByIDAsc = [NSSortDescriptor sortDescriptorWithKey:@"playerID" ascending:YES];
         //        NSArray *sortedPlayers = [players sortedArrayUsingSelector:sortByIDAsc];
         
         self.players = [players mutableCopy];
         [self.tableView reloadData];
         NSLog(@"players: %@", self.players);
     }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.players.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playerRow" forIndexPath:indexPath];
    
    NSInteger row = indexPath.row;
    
    NSDictionary *player = self.players[row];
    
    NSString *playerID = player[@"playerID"];
    NSString *firstName = player[@"firstName"];
    NSString *lastName = player[@"lastName"];
    NSString *fullName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
    
    cell.textLabel.text = fullName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"#%@", playerID];
    
    return cell;
}

#pragma mark - Navigation

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AMYPlayerDetailViewController *playerDestinationVC = segue.destinationViewController;
    
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    NSInteger row = indexPath.row;
    
    playerDestinationVC.player = self.players[row];
//    [playerDestinationVC setPlayer:self.players[row]];
}

@end
