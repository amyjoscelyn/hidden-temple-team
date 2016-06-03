//
//  AMYPlayerDetailViewController.m
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 5/31/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYPlayerDetailViewController.h"

@interface AMYPlayerDetailViewController ()

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *birthdate;
@property (nonatomic, strong) NSString *playerID;

@property (weak, nonatomic) IBOutlet UILabel *playerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthdateLabel;

@end

@implementation AMYPlayerDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"player: %@", self.player);
    
    NSString *dateString = self.player[@"birthdate"];
    self.firstName = self.player[@"firstName"];
    self.lastName = self.player[@"lastName"];
    self.playerID = self.player[@"playerID"];
    
    NSTimeInterval timeInSeconds = dateString.integerValue / 1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInSeconds];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    
    self.birthdate = [formatter stringFromDate:date];
    
    self.playerNameLabel.text = [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
    self.playerIDLabel.text = [NSString stringWithFormat:@"#%@", self.playerID];
    self.birthdateLabel.text = [NSString stringWithFormat:@"born: %@", self.birthdate];
    
    //I want too to have a table within this view holding the teams (and dates hired) that player has been on, that when selected will segue to the appropriate team detail view.  I just need the team detail view first...
}

@end
