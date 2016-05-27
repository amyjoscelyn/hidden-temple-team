//
//  Team+CoreDataProperties.h
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 5/27/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Team.h"

NS_ASSUME_NONNULL_BEGIN

@interface Team (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *teamID;
@property (nullable, nonatomic, retain) NSString *teamName;
@property (nullable, nonatomic, retain) NSSet<Player *> *players;
@property (nullable, nonatomic, retain) NSSet<Game *> *games;
@property (nullable, nonatomic, retain) Roster *roster;

@end

@interface Team (CoreDataGeneratedAccessors)

- (void)addPlayersObject:(Player *)value;
- (void)removePlayersObject:(Player *)value;
- (void)addPlayers:(NSSet<Player *> *)values;
- (void)removePlayers:(NSSet<Player *> *)values;

- (void)addGamesObject:(Game *)value;
- (void)removeGamesObject:(Game *)value;
- (void)addGames:(NSSet<Game *> *)values;
- (void)removeGames:(NSSet<Game *> *)values;

@end

NS_ASSUME_NONNULL_END
