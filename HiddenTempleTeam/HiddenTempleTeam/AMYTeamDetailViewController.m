//
//  AMYTeamDetailViewController.m
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 6/1/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYTeamDetailViewController.h"

@interface AMYTeamDetailViewController ()

@property (nonatomic, strong) NSString *teamName;
@property (nonatomic, strong) NSString *teamID;

@property (weak, nonatomic) IBOutlet UILabel *teamNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *teamIDLabel;
@property (weak, nonatomic) IBOutlet UIImageView *teamImage;

@end

@implementation AMYTeamDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.teamName = self.team[@"teamName"];
    self.teamID = self.team[@"teamID"];
    
    self.teamNameLabel.text = [NSString stringWithFormat:@"%@", self.teamName];
    self.teamIDLabel.text = [NSString stringWithFormat:@"team #%@", self.teamID];
}

@end
