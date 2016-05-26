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
 games--date?date=, hometeam?id=, awayteam?id=, homescore?score=, awayscore?score=, all
 roster--id?id=, team?id=, player?id=, hiredate?date=, all
 */

+ (void)getInfoFromRepositoryWithQuery:(NSString*)query completion:(void (^)(NSArray *))completion
{
    NSString *urlString = [NSString stringWithFormat:@"http://localhost:8080/%@", query];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *playersArray = responseObject;
        
        completion(playersArray);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //code for error
        NSLog(@"ERROR: %@", error.localizedDescription);
    }];
}

@end
