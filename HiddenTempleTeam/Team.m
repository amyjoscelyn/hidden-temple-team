//
//  Team.m
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 5/27/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "Team.h"

@implementation Team

+ (Team *)createTeamFromQueryResult:(NSArray *)queryResult managedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Team *team = [NSEntityDescription insertNewObjectForEntityForName:@"Team" inManagedObjectContext:managedObjectContext];
    
    //array of dictionaries; teamID=key0, teamName=key1 (first object, last object)
    
    NSString *query = @"teams/all";
    
    [AMYLocalHostAPIClient getInfoFromRepositoryWithQuery:query completion:^(NSArray *result) {
        NSLog(@"%@", result);
        //This particular result is an array of six dictionaries.  How did I do this in my other project?
    }];
    
    
    
//    team.teamID =
//    team.teamName =
    
/*        {
    teamID = 1;
    teamName = "Red Jaguars";
},
{
    teamID = 2;
    teamName = "Blue Barracudas";
},
{
    teamID = 3;
    teamName = "Green Monkeys";
},
{
    teamID = 4;
    teamName = "Orange Iguanas";
},
{
    teamID = 5;
    teamName = "Purple Parrots";
},
{
    teamID = 6;
    teamName = "Silver Snakes";
}
*/

    return team;
}

@end
