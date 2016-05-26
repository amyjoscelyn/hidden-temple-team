//
//  AMYLocalHostAPIClient.m
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 5/26/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYLocalHostAPIClient.h"
#import <AFNetworking.h>

@implementation AMYLocalHostAPIClient

/*
 baseURL: localhost:8080/
 players--id?id=, firstname?name=, lastname?name=, birthdate?date=, all
 teams--id?id=, name?name= (space: %20), all
 games--date?date=, hometeam?id=, awayteam?id=, homescore?score=, awayscore?score=, all
 roster--id?id=, team?id=, player?id=, hiredate?date=, all
 */

+ (void)getAllPlayersWithCompletion:(void (^)(NSArray *))completion
{
    NSString *allPlayersURLString = [NSString stringWithFormat:@"http://localhost:8080/players/all"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:allPlayersURLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *playersArray = responseObject;
        
        completion(playersArray);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //code for error
        NSLog(@"ERROR: %@", error.localizedDescription);
    }];
}

+ (void)getAllGamesWithCompletion:(void (^)(NSArray *))completion
{
    NSString *allPlayersURLString = [NSString stringWithFormat:@"http://localhost:8080/games/all"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:allPlayersURLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *gamesArray = responseObject;
        
        completion(gamesArray);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //code for error
        NSLog(@"ERROR: %@", error.localizedDescription);
    }];
}

+ (void)getTeamRosterWithCompletion:(void (^)(NSArray *))completion
{
    NSString *allPlayersURLString = [NSString stringWithFormat:@"http://localhost:8080/roster/all"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:allPlayersURLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *rosterArray = responseObject;
        
        completion(rosterArray);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //code for error
        NSLog(@"ERROR: %@", error.localizedDescription);
    }];
}

+ (void)getAllTeamsWithCompletion:(void (^)(NSArray *))completion
{
    NSString *allPlayersURLString = [NSString stringWithFormat:@"http://localhost:8080/teams/all"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:allPlayersURLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *teamsArray = responseObject;
        
        completion(teamsArray);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //code for error
        NSLog(@"ERROR: %@", error.localizedDescription);
    }];
}

@end
