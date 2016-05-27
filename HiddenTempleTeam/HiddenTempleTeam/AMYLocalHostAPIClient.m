//
//  AMYLocalHostAPIClient.m
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 5/26/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYLocalHostAPIClient.h"
#import <AFNetworking.h>

@interface AMYLocalHostAPIClient ()

@property (nonatomic, strong) NSString *baseURL;

@end

@implementation AMYLocalHostAPIClient

/*
 baseURL: localhost:8080/
 players--id?id=, firstname?name=, lastname?name=, birthdate?date=, all
 teams--id?id=, name?name= (space: %20), all
 games--id?id=, date?date=, hometeam?id=, awayteam?id=, homescore?score=, awayscore?score=, all
 roster--id?id=, team?id=, player?id=, hiredate?date=, all
 
 @"players/id?id="
 @"players/firstname?name="
 @"players/lastname?name="
 @"players/birthdate?=" // I need to change how dates show up in Spring
 
 @"teams/id?id="
 @"teams/name?name="
 
 @"games/id?id=" //?????
 @"games/date?date="
 @"games/hometeam?id="
 @"games/awayteam?id="
 @"games/homescore?score="
 @"games/awayscore?score="
 
 @"roster/id?id="
 @"roster/team?id="
 @"roster/player?id="
 @"roster/hiredate?date="
 
 I STARTED WORKING 5/26/16 AT 6:07p TONIGHT!!!!!!!!!
 I ENDED WORKING AT 6:37.  That's half an hour--fifteen minutes to go!
 
 Starting again at 7:53p (to end between 8:03 and 8:08!)
 Let's just call it a day.  45 minutes!
 */

+ (void)getInfoFromRepositoryWithQuery:(NSString*)query completion:(void (^)(NSArray *))completion
{
    NSString *urlString = [NSString stringWithFormat:@"http://localhost:8080/%@", query];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *resultArray = responseObject;
        
        completion(resultArray);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //code for error
        NSLog(@"ERROR: %@", error.localizedDescription);
    }];
}

@end
