//
//  Team.h
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 5/27/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AMYLocalHostAPIClient.h"

@class Game, Player, Roster;

NS_ASSUME_NONNULL_BEGIN

@interface Team : NSManagedObject

+ (Team *)createTeamFromQueryResult:(NSArray *)queryResult managedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end

NS_ASSUME_NONNULL_END

#import "Team+CoreDataProperties.h"
