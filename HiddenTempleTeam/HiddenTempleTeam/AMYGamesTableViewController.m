//
//  AMYGamesTableViewController.m
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 6/1/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYGamesTableViewController.h"
#import "AMYGameDetailViewController.h"
#import "AMYLocalHostAPIClient.h"
#import "AMYSharedDataStore.h"

@interface AMYGamesTableViewController ()

@property (nonatomic, strong) NSMutableArray *games;
@property (nonatomic, strong) AMYSharedDataStore *dataStore;

@end

@implementation AMYGamesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
     =======================================================
           THIS HAS NOT YET BEEN TESTED WITH LIVE DATA
     =======================================================
     */
    [super viewDidLoad];
    
    self.dataStore = [AMYSharedDataStore sharedStoryDataStore];
    
    [AMYLocalHostAPIClient getInfoFromRepositoryWithQuery:@"games/all" completion:^(NSArray *games)
     {
         self.games = [games mutableCopy];
         [self.tableView reloadData];
         NSLog(@"teams: %@", self.games);
     }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
    //    return self.games.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"gameRow" forIndexPath:indexPath];
    
    NSInteger row = indexPath.row;
    cell.textLabel.text = [NSString stringWithFormat:@"team # %li", row];
    
    /*
     =======================================================
           THIS HAS NOT YET BEEN TESTED WITH LIVE DATA
     =======================================================
     *-/
    
    NSDictionary *game = self.games[row];
    
    NSString *gameID = game[@"id"];
    NSString *homeTeam = game[@"id"];
    NSString *awayTeam = game[@"id"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ vs. %@", homeTeam, awayTeam];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", gameID];
    
    */
    
    return cell;
}

/*
 =======================================================
       THIS HAS NOT YET BEEN TESTED WITH LIVE DATA
 =======================================================
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AMYGameDetailViewController *gameDestinationVC = segue.destinationViewController;
    
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    NSInteger row = indexPath.row;
    
    gameDestinationVC.game = self.games[row];
    
    //temp!!!!!!!!!!!
    gameDestinationVC.tempID = row;
}

@end
