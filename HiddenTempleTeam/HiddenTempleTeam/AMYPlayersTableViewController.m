//
//  AMYPlayersTableViewController.m
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 5/26/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYPlayersTableViewController.h"
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
