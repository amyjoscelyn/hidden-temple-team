//
//  AMYLocalHostAPIClient.h
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 5/26/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMYLocalHostAPIClient : NSObject

+ (void)getAllPlayersWithCompletion:(void (^)(NSArray *))completion;

+ (void)getAllGamesWithCompletion:(void (^)(NSArray *))completion;

+ (void)getAllTeamsWithCompletion:(void (^)(NSArray *))completion;

+ (void)getTeamRosterWithCompletion:(void (^)(NSArray *))completion;

@end
