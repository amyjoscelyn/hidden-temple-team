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
@property (nonatomic, strong) CAGradientLayer *gradientLayer;

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
    
    [self displayTeamImage];
    self.teamImage.layer.borderWidth = 2;
    self.teamImage.layer.borderColor = [UIColor brownColor].CGColor;
    
    [self setBackgroundColor];
}

- (void)setBackgroundColor
{
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = self.view.frame;
    [self.view.layer insertSublayer:self.gradientLayer atIndex:0];
    
    UIColor *firstColor = [UIColor colorWithRed:254/256.0 green:253/256.0 blue:56/256.0 alpha:1.0];
    UIColor *secondColor = [UIColor colorWithRed:176/256.0 green:123/256.0 blue:23/256.0 alpha:1.0];
    UIColor *thirdColor = [UIColor colorWithRed:117/256.0 green:80/256.0 blue:25/256.0 alpha:1.0];
    UIColor *fourthColor = [UIColor colorWithRed:68/256.0 green:49/256.0 blue:16/256.0 alpha:1.0];
    
    NSArray *colorsArray = @[(id)firstColor.CGColor, (id)secondColor.CGColor, (id)thirdColor.CGColor, (id)fourthColor.CGColor];
    self.gradientLayer.colors = colorsArray;
    self.gradientLayer.locations = @[@0.0, @0.35, @0.68, @0.95];
    //there should be a location for every color in the array
}

- (void)displayTeamImage
{
    NSInteger id = self.teamID.integerValue;
    
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
        //team is Green Monkeys
        self.teamImage.image = [UIImage imageNamed:@"Green_Monkeys"];
    }
    else if (id == 4)
    {
        //team is Orange Iguanas
        self.teamImage.image = [UIImage imageNamed:@"Orange_Iguanas"];
    }
    else if (id == 5)
    {
        //team is Purple Parrots
        self.teamImage.image = [UIImage imageNamed:@"Purple_Parrots"];
    }
    else if (id == 6)
    {
        //team is Silver Snakes
        self.teamImage.image = [UIImage imageNamed:@"Silver_Snakes"];
    }
    
    /*
     background colors:
     #FFFD38 daffodil, color of yellow of animals (254, 253, 56)
     #81634F pastel brown (129, 99, 79) 117, 80, 25
     176, 123, 23 || 68, 49, 16
     
     Maybe I can have a different, darker shade of each of the animals, a red/blue/orange/yellow/green/silver to complement each team.  Or maybe there should be a single, common color for the background and each of those darker shades can be the text colors?
     
     Maybe if I distilled a color from the Legend legend for the common background?  Or that can at least be the background for each player?  Or should players have a different background based on the team they're currently on?
     
     How about if I try a gradient with daffodil yellow with the background of the launch screen?
     */
    
    //*****Images from Nickelodeon Wiki for 'Legends of the Hidden Temple' ( http://nickelodeon.wikia.com/wiki/Legends_of_the_Hidden_Temple )*********************
}

@end
