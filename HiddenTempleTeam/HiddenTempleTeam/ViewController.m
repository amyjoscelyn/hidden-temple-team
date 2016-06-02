//
//  ViewController.m
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 5/26/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "ViewController.h"
#import "AMYLocalHostAPIClient.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
     I added a TableView to each detailVC--Player should contain the teams they've been on in the past, with their hire date.  Current Team should be on top, and their background should reflect the team they're currently on.  Tapping on a team should take it to that team's detailVC.
     Team should contain the players currently on the team... maybe there should be a switch or tab you can tap to switch it to the history of players.
     Oh there also should be something about the games they've played and have coming up... I forgot all about that.  Huh.  Maybe there can be multiple tabs of the table they can choose, one for current lineup, past players, and games (past and future).
     
     Team Roster, being the join table, is a little tricky to differentiate from Teams.  The Team Roster contains the hiredate of all players to the teams.  Maybe I should display a Roster instead of the Teams page, unless Teams page contains information about them.  Ooh, that would be an interesting way to integrate a database with a csv-spreadsheet DB, by hooking up description codes on the server to descriptions from the CSV.  But anyway, I get ahead of myself.
     
     Team Roster, Game, and Players.  Team Roster can show team name, id#, history of players hired by date, as well as current players.
     
     They should be able to link to each other. You should be able to click on a person's name, and be brought to a playerInfo view, where you can see their info in depth.  I would need to segue to it, and have it be reloadable, so I'll set up a single pattern and stick with it for all of them.  Their info is uniform anyway. It should be able to show all players, including those unassigned.
     
     You should be able to see wins and losses for each team, as well as a leader board and maybe some stats--the team that's scored the most, the team that plays best home vs away, and maybe a bracket?
     
     I should be able to utilise the addPlayer, registerToTeam, and generate the next game and who's playing whom from SQL.
     
     Sounds great to me!
     */
}

- (IBAction)allPlayersTapped:(id)sender
{    
    NSString *query = @"players/all";
    
    [AMYLocalHostAPIClient getInfoFromRepositoryWithQuery:query completion:^(NSArray *result) {
        NSLog(@"%@", result);
    }];
}
- (IBAction)allTeamsTapped:(id)sender
{
    NSString *query = @"teams/all";
    
    [AMYLocalHostAPIClient getInfoFromRepositoryWithQuery:query completion:^(NSArray *result) {
        NSLog(@"%@", result);
    }];
}

- (IBAction)fullTeamRosterTapped:(id)sender
{
    NSString *query = @"roster/all";
    
    [AMYLocalHostAPIClient getInfoFromRepositoryWithQuery:query completion:^(NSArray *result) {
        NSLog(@"%@", result);
    }];
}

- (IBAction)allGamesTapped:(id)sender
{
    NSString *query = @"games/all";
    
    [AMYLocalHostAPIClient getInfoFromRepositoryWithQuery:query completion:^(NSArray *result) {
        NSLog(@"%@", result);
    }];
}

@end
