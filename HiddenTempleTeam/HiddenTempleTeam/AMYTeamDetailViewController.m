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
    
    /*
     =======================================================
           THIS HAS NOT YET BEEN TESTED WITH LIVE DATA
     =======================================================
     */
    
    self.teamName = self.team[@"teamName"];
    self.teamID = self.team[@"teamID"];
    
    self.teamNameLabel.text = [NSString stringWithFormat:@"%@", self.teamName];
    self.teamIDLabel.text = [NSString stringWithFormat:@"team #%@", self.teamID];
    
    [self displayTeamImage];
    self.teamImage.layer.borderWidth = 2;
    self.teamImage.layer.borderColor = [UIColor darkGrayColor].CGColor;
}

- (void)displayTeamImage
{
    NSInteger id = self.teamID.integerValue;
    
    //temp!!!!!!!!!!
    id = self.tempID + 1;
    
    if (id == 1)
    {
        //team is Red Jaguars
        self.teamImage.image = [UIImage imageNamed:@"Red_Jaguars"];
    }
    else if (id == 2)
    {
        //team is Blue Barracudas
        self.teamImage.image = [UIImage imageNamed:@"Blue_Barracudas"];
    }
    else if (id == 3)
    {
        //team is Orange Iguanas
        self.teamImage.image = [UIImage imageNamed:@"Orange_Iguanas"];
    }
    else if (id == 4)
    {
        //team is Purple Parrots
        self.teamImage.image = [UIImage imageNamed:@"Purple_Parrots"];
    }
    else if (id == 5)
    {
        //team is Green Monkeys
        self.teamImage.image = [UIImage imageNamed:@"Green_Monkeys"];
    }
    else if (id == 6)
    {
        //team is Silver Snakes
        self.teamImage.image = [UIImage imageNamed:@"Silver_Snakes"];
    }
    
    //*****Images from Nickelodeon Wiki for 'Legends of the Hidden Temple' ( http://nickelodeon.wikia.com/wiki/Legends_of_the_Hidden_Temple )*********************
}

@end
