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

@end

@implementation AMYGameDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
     =======================================================
           THIS HAS NOT YET BEEN TESTED WITH LIVE DATA
     =======================================================
     */
    
    self.gameDate = self.game[@"game_date"];
    self.gameID = self.game[@"game_id"];
    self.homeTeamID = self.game[@"home_team"];
    self.awayTeamID = self.game[@"away_team"];
    self.homeTeamScore = self.game[@"home_score"];
    self.awayTeamScore = self.game[@"away_score"];
    
    self.gameHeaderLabel.text = [NSString stringWithFormat:@"Game #%@, %@", self.gameID, self.gameDate];
    self.homeTeamNameLabel.text = [NSString stringWithFormat:@"team #%@", self.homeTeamID];
    self.awayTeamNameLabel.text = [NSString stringWithFormat:@"team #%@", self.awayTeamID];
    self.homeTeamScoreLabel.text = [NSString stringWithFormat:@"%@", self.homeTeamScore];
    self.awayTeamScoreLabel.text = [NSString stringWithFormat:@"%@", self.awayTeamScore];
    
    [self determineWinner];
    
    /*
     That's for games that have already been played, which is the only data I have right now
     
     Games that have not yet been played can have similar info, either left blank or just the basic team v. team
     
     Right now I only have the ids.  I feel like in order to get the names of the teams based on the ids (and all that other INNER JOIN info) I need to do it in Spring.  For now I'll just use the ids.
     */
}

- (void)determineWinner
{
    NSInteger homeScore = self.homeTeamScore.integerValue;
    NSInteger awayScore = self.awayTeamScore.integerValue;
    
    if (homeScore == awayScore)
    {
        //it's a tie!
        self.gameResultLabel.text = @"This game was a tie!";
    }
    if (homeScore > awayScore)
    {
        //home wins!
        
        self.homeView.backgroundColor = [UIColor purpleColor];
        
        self.gameResultLabel.text = [NSString stringWithFormat:@"#%@ won this game!", self.homeTeamID];
    }
    else //RIGHT NOW away always wins because there are no scores
    {
        //away wins!
        
        self.awayView.backgroundColor = [UIColor purpleColor];
        
        self.gameResultLabel.text = [NSString stringWithFormat:@"#%@ won this game!", self.awayTeamID];
    }
}

@end
