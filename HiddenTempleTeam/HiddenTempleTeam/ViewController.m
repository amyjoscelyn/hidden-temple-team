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
}

- (IBAction)allPlayersTapped:(id)sender
{    
    NSString *query = @"players/all";
    
    [AMYLocalHostAPIClient getInfoFromRepositoryWithQuery:query completion:^(NSArray *players) {
        NSLog(@"%@", players);
    }];
}
- (IBAction)allTeamsTapped:(id)sender
{
    NSString *query = @"teams/all";
    
    [AMYLocalHostAPIClient getInfoFromRepositoryWithQuery:query completion:^(NSArray *players) {
        NSLog(@"%@", players);
    }];
}

- (IBAction)fullTeamRosterTapped:(id)sender
{
    NSString *query = @"roster/all";
    
    [AMYLocalHostAPIClient getInfoFromRepositoryWithQuery:query completion:^(NSArray *players) {
        NSLog(@"%@", players);
    }];
}

- (IBAction)allGamesTapped:(id)sender
{
    NSString *query = @"games/all";
    
    [AMYLocalHostAPIClient getInfoFromRepositoryWithQuery:query completion:^(NSArray *players) {
        NSLog(@"%@", players);
    }];
}

@end
