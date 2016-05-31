//
//  AMYLocalHostAPIClient.h
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 5/26/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMYLocalHostAPIClient : NSObject

+ (void)getRepositoryWithQuery:(NSString *)query completion:(void (^)(NSArray *))completion;

@end
