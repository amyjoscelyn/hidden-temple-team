//
//  AMYSharedDataStore.h
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 5/27/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Team+CoreDataProperties.h"
#import "Player+CoreDataProperties.h"
#import "Game+CoreDataProperties.h"
#import "Roster+CoreDataProperties.h"

@interface AMYSharedDataStore : NSObject

@property (strong, nonatomic, readonly) NSArray *players;
@property (strong, nonatomic, readonly) NSArray *teams;
@property (strong, nonatomic, readonly) NSArray *games;
@property (strong, nonatomic, readonly) Roster *roster;

//@property (strong, nonatomic, readonly) NSSortDescriptor *sortByIDAsc;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (instancetype)sharedStoryDataStore;

- (void)fetchData;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
