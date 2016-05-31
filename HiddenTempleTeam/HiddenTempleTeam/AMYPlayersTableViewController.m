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
    
    self.tableView.accessibilityLabel=@"Hidden Temple Table View";
    self.tableView.accessibilityIdentifier=@"Hidden Temple Table View";
    
    self.tableView.accessibilityIdentifier = @"Hidden Temple Table View";
    self.tableView.accessibilityLabel=@"Hidden Temple Table View";
    
    [self.dataStore getPlayerRepositoriesWithCompletion:^(BOOL success)
     {
         //this is last in the line up
         NSLog(@"INSIDE TABLE VC   - 5");
         [self.tableView reloadData];
     }];
    
//    self.dataStore.players;
    
//    [AMYLocalHostAPIClient getInfoFromRepositoryWithQuery:@"players/all" completion:^(NSArray *players)
//    {
//        self.players = [players mutableCopy];
//    }];
    
//    NSLog(@"players: %@", self.players);

    for (NSInteger i = 0; i < 6; i++)
    {
        NSString *query = [NSString stringWithFormat:@"teams/id?id=%li", i+1];
        
//        [AMYLocalHostAPIClient getInfoFromRepositoryWithQuery:query completion:^(NSArray *result) {
//            
//            NSDictionary *currentDictionary = result.firstObject;
//
//            NSLog(@"%@", currentDictionary);
//            
//            [self.players addObject:currentDictionary];
//        }];
    }
    //okay so the issue here is that this is running in a block as soon as the view has loaded.  because of this, getting the count will be impossible without waiting for all of the time the block requires to finish just to get the count of objects in the array.
    //so what I should try to do is set the objects beforehand, upon opening the app, into the datastore.  Then i can call upon the data store saved properties and find the count that way.  Or I should be able to, anyway.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return self.players.count;
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playerRow" forIndexPath:indexPath];
    
    NSInteger row = indexPath.row;
    
    NSDictionary *player = self.players[row];
    
    NSString *playerID = player[@"playerID"];
    
//    cell.textLabel.text = playerID;
    
    cell.textLabel.text = [NSString stringWithFormat:@"table row: %li", row];
    
        //birthdate=0
        //firstname=1
        //lastname=2
        //id=3
    
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
