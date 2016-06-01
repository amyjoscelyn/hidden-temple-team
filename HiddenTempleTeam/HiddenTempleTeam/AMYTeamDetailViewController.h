//
//  AMYTeamDetailViewController.h
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 6/1/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMYTeamDetailViewController : UIViewController

@property (nonatomic) NSInteger tempID;

/*
 =======================================================
 THIS HAS NOT YET BEEN TESTED WITH LIVE DATA
 =======================================================
 */
@property (nonatomic, strong) NSDictionary *team;
@property (nonatomic, strong) UIImage *image;

@end
