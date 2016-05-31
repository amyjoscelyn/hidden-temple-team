//
//  AMYSharedDataStore.m
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 5/27/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYSharedDataStore.h"
#import "AMYLocalHostAPIClient.h"
#import "AMYHiddenTempleRepository.h"

@interface AMYSharedDataStore ()

@property (strong, nonatomic, readwrite) NSArray *players;
@property (strong, nonatomic, readwrite) NSArray *teams;
@property (strong, nonatomic, readwrite) NSArray *games;
@property (strong, nonatomic, readwrite) Roster *roster;

@property (strong, nonatomic, readwrite) NSSortDescriptor *sortByIDAsc;

@end

@implementation AMYSharedDataStore

+ (instancetype)sharedStoryDataStore
{
    static AMYSharedDataStore *_sharedStoryDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedStoryDataStore = [[AMYSharedDataStore alloc] init];
    });
    return _sharedStoryDataStore;
}

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
//        _sortByIDAsc = [NSSortDescriptor sortDescriptorWithKey:@"storyID" ascending:YES];
        _repositories=[NSMutableArray new];
    }
    return self;
}

#pragma API Request Test

- (void)getPlayerRepositoriesWithCompletion:(void (^)(BOOL))completionBlock
{
    //this is the first method called
    NSLog(@"INSIDE DATA STORE - 1");
    NSString *query = @"players/all";
    
    [AMYLocalHostAPIClient getRepositoryWithQuery:query completion:^(NSArray *repoDictionaries)
     {
         //this method gets called fourth
         NSLog(@"INSIDE DS METHOD  - 4");
         for (NSDictionary *repoDictionary in repoDictionaries)
         {
             //this gets called immediately for each dictionary in the loop, pt 1
             NSLog(@"INSIDE DS BLOCK  - #");
             [self.repositories addObject:[AMYHiddenTempleRepository repoFromDictionary:repoDictionary]];
         }
         completionBlock(YES);
     }];
}

#pragma mark - Fetch Requests

- (void)fetchData
{
    NSFetchRequest *playerRequest = [NSFetchRequest fetchRequestWithEntityName:@"Player"];
    
    self.players = [self.managedObjectContext executeFetchRequest:playerRequest error:nil];
    
    if (self.players.count == 0)
    {
//        [self generatePlayers];
    }
    
    NSFetchRequest *teamRequest = [NSFetchRequest fetchRequestWithEntityName:@"Team"];
    
    self.teams = [self.managedObjectContext executeFetchRequest:teamRequest error:nil];
    
    if (self.teams.count == 0)
    {
        //        [self generateTeams];
    }
    
    NSFetchRequest *gameRequest = [NSFetchRequest fetchRequestWithEntityName:@"Gae"];
    
    self.games = [self.managedObjectContext executeFetchRequest:gameRequest error:nil];
    
    if (self.games.count == 0)
    {
        //        [self generateGames];
    }
    
    NSFetchRequest *rosterRequest = [NSFetchRequest fetchRequestWithEntityName:@"Roster"];
    
    NSArray *rosterRequestResult = [self.managedObjectContext executeFetchRequest:rosterRequest error:nil];
    
    if (self.roster)
    {
        return;
    }
    else if (rosterRequestResult.count > 0)
    {
        self.roster = [self.managedObjectContext executeFetchRequest:rosterRequest error:nil][0];
    }
    else
    {
//        [self generateRoster];
        return;
    }
}

#pragma Generator Methods

//[self saveContext];
//[self fetchData];

/*
 Okay.  In here, I'll have the four generator methods (generatePlayers, generateTeams, generateGames, and generateRoster).
 I believe that each of those should "generate" by hooking up to the API.
 So I'll need to make some public methods in my API client where I can generate all the info I need...
 One way I can go about it with the requests is to query for /all and return the resulting array.  Then, in the generator method, I can break down the array into the dictionaries and set each appropriate row as an instance of the entity.
 
 You know, for ____ in _____...
 
 Similar to:
 
 NSArray *prerequisiteRows = [self parsedCSVContentsWithFileName:@"Prerequisite-Table 1"];
 
 for (NSArray *csvRow in prerequisiteRows)
 {
 [Prerequisite createPrerequisiteFromCSVRow:csvRow managedObjectContext:self.managedObjectContext];
 }
 [self saveContext];
 [self fetchData];
 
 but instead of the CSV it'll come back from the API.
 
 OH WAIT.  I remember now that I had that CSV method coming from the ManagedObjectSubclasses themselves.  So I can do the query call from there (to the API Client) and then when I call upon THAT method in the generateEntity methods, I can set the attributes from that, and worry about the relationship generation later!!!
 */

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory
{
    // The directory the application uses to store the Core Data store file. This code uses a directory in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel
{
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil)
    {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"DreamGame" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil)
    {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"DreamGame.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext
{
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil)
    {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator)
    {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext
{
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
