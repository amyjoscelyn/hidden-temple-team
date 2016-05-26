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
    
    [AMYLocalHostAPIClient getAllPlayersWithCompletion:^(NSArray *players)
     {
         NSLog(@"%@", players);
     }];
    
    [AMYLocalHostAPIClient getAllGamesWithCompletion:^(NSArray *games)
     {
         NSLog(@"%@", games);
     }];
    
    [AMYLocalHostAPIClient getAllTeamsWithCompletion:^(NSArray *teams)
     {
         NSLog(@"%@", teams);
     }];
    
    [AMYLocalHostAPIClient getTeamRosterWithCompletion:^(NSArray *roster)
     {
         NSLog(@"%@", roster);
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)allPlayersTapped:(id)sender
{
    
}
- (IBAction)allTeamsTapped:(id)sender
{
    
}

- (IBAction)fullTeamRosterTapped:(id)sender
{
    
}

- (IBAction)allGamesTapped:(id)sender
{
    
}

@end
