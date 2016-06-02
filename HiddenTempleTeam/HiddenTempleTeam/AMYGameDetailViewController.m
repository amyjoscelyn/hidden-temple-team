//
//  AMYGameDetailViewController.m
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 6/1/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYGameDetailViewController.h"

@interface AMYGameDetailViewController ()

@property (nonatomic, strong) NSString *gameID;
@property (nonatomic, strong) NSString *gameDate;
@property (nonatomic, strong) NSString *homeTeamID;
@property (nonatomic, strong) NSString *awayTeamID;
@property (nonatomic, strong) NSString *homeTeamScore;
@property (nonatomic, strong) NSString *awayTeamScore;

@property (weak, nonatomic) IBOutlet UILabel *gameHeaderLabel;

@property (weak, nonatomic) IBOutlet UILabel *homeTeamNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeTeamScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *awayTeamNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *awayTeamScoreLabel;

@property (weak, nonatomic) IBOutlet UIView *homeView;
@property (weak, nonatomic) IBOutlet UIView *awayView;
@property (weak, nonatomic) IBOutlet UILabel *gameResultLabel;

@property (weak, nonatomic) IBOutlet UIView *scoreView;
@property (weak, nonatomic) IBOutlet UIImageView *homeTeamImageView;
@property (weak, nonatomic) IBOutlet UIImageView *awayTeamImageView;

@end

@implementation AMYGameDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.gameID = self.game[@"gameID"];
    self.homeTeamID = self.game[@"homeTeam"];
    self.awayTeamID = self.game[@"awayTeam"];
    self.homeTeamScore = self.game[@"homeTeamScore"];
    self.awayTeamScore = self.game[@"awayTeamScore"];
    
    [self formatGameDate];
    
    self.gameHeaderLabel.text = [NSString stringWithFormat:@"Game #%@, %@", self.gameID, self.gameDate];
    self.homeTeamNameLabel.text = [NSString stringWithFormat:@"team #%@", self.homeTeamID];
    self.awayTeamNameLabel.text = [NSString stringWithFormat:@"team #%@", self.awayTeamID];
    self.homeTeamScoreLabel.text = [NSString stringWithFormat:@"%@", self.homeTeamScore];
    self.awayTeamScoreLabel.text = [NSString stringWithFormat:@"%@", self.awayTeamScore];
    
    [self displayImage:self.homeTeamImageView forTeam:self.homeTeamID];
    [self displayImage:self.awayTeamImageView forTeam:self.awayTeamID];
    
    self.homeTeamImageView.layer.borderWidth = 2;
    self.homeTeamImageView.layer.borderColor = [UIColor brownColor].CGColor;
    self.awayTeamImageView.layer.borderWidth = 2;
    self.awayTeamImageView.layer.borderColor = [UIColor brownColor].CGColor;
    
    [self determineWinner];
    
    /*
     That's for games that have already been played, which is the only data I have right now
     
     Games that have not yet been played can have similar info, either left blank or just the basic team v. team
     
     Right now I only have the ids.  I feel like in order to get the names of the teams based on the ids (and all that other INNER JOIN info) I need to do it in Spring.  For now I'll just use the ids.
     
     It would be neat to have a gradient for the background of the games as well--those that have been played can have the winning team color on the bottom, with the yellow brown or whatever on top
     Games not yet played or tied can be the yellow to brown gradient of the background of the teams.
     */
}

- (void)formatGameDate
{
    NSString *dateString = self.game[@"gameDate"];
    
    NSTimeInterval timeInSeconds = dateString.integerValue / 1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInSeconds];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    
    self.gameDate = [formatter stringFromDate:date];
}

- (void)displayImage:(UIImageView *)image forTeam:(NSString *)teamID
{
    NSInteger id = teamID.integerValue;
    
    if (id == 1)
    {
        //team is Red Jaguars
        image.image = [UIImage imageNamed:@"Red_Jaguars"];
    }
    else if (id == 2)
    {
        //team is Blue Barracudas
        image.image = [UIImage imageNamed:@"Blue_Barracudas"];
    }
    else if (id == 3)
    {
        //team is Green Monkeys
        image.image = [UIImage imageNamed:@"Green_Monkeys"];
    }
    else if (id == 4)
    {
        //team is Orange Iguanas
        image.image = [UIImage imageNamed:@"Orange_Iguanas"];
    }
    else if (id == 5)
    {
        //team is Purple Parrots
        image.image = [UIImage imageNamed:@"Purple_Parrots"];
    }
    else if (id == 6)
    {
        //team is Silver Snakes
        image.image = [UIImage imageNamed:@"Silver_Snakes"];
    }
}

- (void)determineWinner
{
    NSInteger homeScore = self.homeTeamScore.integerValue;
    NSInteger awayScore = self.awayTeamScore.integerValue;
//    NSLog(@"%li to %li", homeScore, awayScore);
    
    if (homeScore < awayScore)
    {
        //away wins!
        self.awayView.backgroundColor = [UIColor colorWithRed:128/255.0 green:64/255.0 blue:32/255.0 alpha:0.5];
        self.gameResultLabel.text = [NSString stringWithFormat:@"#%@ won this game!", self.awayTeamID];
    }
    if (homeScore > awayScore)
    {
        //home wins!
        self.homeView.backgroundColor = [UIColor colorWithRed:128/255.0 green:64/255.0 blue:32/255.0 alpha:0.5];
        self.gameResultLabel.text = [NSString stringWithFormat:@"#%@ won this game!", self.homeTeamID];
    }
    else
    {
        //it's a tie!
        self.gameResultLabel.text = @"This game was a tie!";
    }
}

@end
