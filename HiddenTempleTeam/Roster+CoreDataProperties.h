//
//  Roster+CoreDataProperties.h
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 5/27/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Roster.h"

NS_ASSUME_NONNULL_BEGIN

@interface Roster (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *rosterID;
@property (nullable, nonatomic, retain) NSNumber *teamID;
@property (nullable, nonatomic, retain) NSNumber *playerID;
@property (nullable, nonatomic, retain) NSDate *hireDate;
@property (nullable, nonatomic, retain) NSSet<Player *> *players;
@property (nullable, nonatomic, retain) NSSet<Team *> *teams;

@end

@interface Roster (CoreDataGeneratedAccessors)

- (void)addPlayersObject:(Player *)value;
- (void)removePlayersObject:(Player *)value;
- (void)addPlayers:(NSSet<Player *> *)values;
- (void)removePlayers:(NSSet<Player *> *)values;

- (void)addTeamsObject:(Team *)value;
- (void)removeTeamsObject:(Team *)value;
- (void)addTeams:(NSSet<Team *> *)values;
- (void)removeTeams:(NSSet<Team *> *)values;

@end

NS_ASSUME_NONNULL_END
