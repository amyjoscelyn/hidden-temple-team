//
//  AMYHiddenTempleRepository.m
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 5/31/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYHiddenTempleRepository.h"

@implementation AMYHiddenTempleRepository

+ (AMYHiddenTempleRepository *)repoFromDictionary:(NSDictionary *)repoDictionary
{
    //this is called once for every dictionary in the array, part 2
    NSLog(@"INSIDE REPOSITORY - ?");
    AMYHiddenTempleRepository *repo = [[AMYHiddenTempleRepository alloc] init];

    repo.birthdate = [repoDictionary[@"birthdate"] stringValue];
    repo.firstName = repoDictionary[@"full_name"];
    repo.lastName = repoDictionary[@"last_name"];
    repo.playerID = [repoDictionary[@"id"] stringValue];
    
//    NSLog(@"Player %@: %@ %@, born: %@", repo.playerID, repo.firstName, repo.lastName, repo.birthdate);
    
    //WHY IS NOTHING GETTING RETURNED HERE????  WHAT EXACTLY IS THIS RETURN FOR THEN????????
    return repo;
}

@end
