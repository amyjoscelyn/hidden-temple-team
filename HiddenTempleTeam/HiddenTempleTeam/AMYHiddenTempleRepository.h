//
//  AMYHiddenTempleRepository.h
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 5/31/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMYHiddenTempleRepository : NSObject

// PLAYER Repository, @name properties

//`NSString` full name of repository. Comes from the "player_first_name" and "player_last_name" keys

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;

// `NSString` birthdate of repository. Comes from the "birthdate" key

@property (strong, nonatomic) NSString *birthdate;


// `NSString` repository ID. Comes from the "player_id" key

@property (strong, nonatomic) NSString *playerID;

+ (AMYHiddenTempleRepository *)repoFromDictionary:(NSDictionary *)repoDictionary;

@end
