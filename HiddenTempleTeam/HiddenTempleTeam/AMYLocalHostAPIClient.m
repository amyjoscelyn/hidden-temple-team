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

NSString *const LOCAL_HOST_API_URL=@"http://localhost:8080";

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
 */

+ (void)getRepositoryWithQuery:(NSString *)query completion:(void (^)(NSArray *))completion
{
    //this is the second method called
    NSLog(@"INSIDE API CLIENT - 2");
    NSString *urlString = [NSString stringWithFormat:@"%@/%@", LOCAL_HOST_API_URL, query];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSArray *resultArray = responseObject;
//        completion(resultArray);
        
        //this method gets called third
        NSLog(@"INSIDE API BLOCK  - 3");
        completion(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //code for error
        NSLog(@"ERROR: %@", error.localizedDescription);
    }];
    
    /*
     maybe what I need to do here is like in Outside, where I use the responseObject to init a custom class object.  You know, set the properties here.  Maybe.
     
     So if I had a custom class for each table... I should be able to set the properties.  Of course, with my ability to make specific API calls, I can.  But also, I don't want to make to many calls.  So it would be best if I could just get the list of /all for each table, put them in a table, and then maybe when I go to the detail view, I can do a separate query for that id based on the row # selected.
     
     But I can't get a single entry until I can NSLog the dictionary outside of the block.
     */
}

+ (NSURL *)getURLWithString:(NSString *)query
{
    NSString *urlString = [NSString stringWithFormat:@"%@/%@", LOCAL_HOST_API_URL, query];
    
    return [NSURL URLWithString:urlString];
}

@end
