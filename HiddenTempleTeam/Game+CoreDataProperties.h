//
//  Game+CoreDataProperties.h
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 5/27/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Game.h"

NS_ASSUME_NONNULL_BEGIN

@interface Game (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *gameID;
@property (nullable, nonatomic, retain) NSString *homeTeam;
@property (nullable, nonatomic, retain) NSString *awayTeam;
@property (nullable, nonatomic, retain) NSString *homeScore;
@property (nullable, nonatomic, retain) NSString *awayScore;
@property (nullable, nonatomic, retain) NSString *gameDate;
@property (nullable, nonatomic, retain) NSSet<Team *> *teams;

@end

@interface Game (CoreDataGeneratedAccessors)

- (void)addTeamsObject:(Team *)value;
- (void)removeTeamsObject:(Team *)value;
- (void)addTeams:(NSSet<Team *> *)values;
- (void)removeTeams:(NSSet<Team *> *)values;

@end

NS_ASSUME_NONNULL_END
