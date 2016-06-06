//
//  AMYPlayerDetailViewController.m
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 5/31/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYPlayerDetailViewController.h"

@interface AMYPlayerDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *birthdate;
@property (nonatomic, strong) NSString *playerID;
@property (nonatomic, strong) NSArray *teamRosters;
//@property (nonatomic, strong) NSString *teamName;
//@property (nonatomic, strong) NSString *hireDate;

@property (weak, nonatomic) IBOutlet UILabel *playerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthdateLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AMYPlayerDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    NSLog(@"player: %@", self.player);
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    NSString *birthdateString = self.player[@"birthdate"];
    self.firstName = self.player[@"firstName"];
    self.lastName = self.player[@"lastName"];
    self.playerID = self.player[@"playerID"];
    
    self.teamRosters = self.player[@"teamRosters"];
//    NSLog(@"teamRosters: %@", self.teamRosters);
    
//    NSLog(@"There are %li teams", self.teamRosters.count);
    
    /*
     Okay!  So teamRosters can either be empty or filled.
     It's an array of dictionaries.  Each dictionary entry is a team.
     What I need to do is have a teamsArray property, and set a custom entry for each team into it, containing the hireDate, teamID, and teamName.  I might not actually need the teamID, but I should get it now anyway, just in case.  For seguing purposes, you know.
     for dictionary in teamRosters
     set hireDate as local hireDateString
     set teamID as teamID
     set teamName as teamName
     
     How am I going to save these though?  I guess I can save them again as dictionaries, each team as a dictionary, and add each dictionary to the array property
     Then I can access the array to set the table, each cell as an individual team dictionary
     */
    
    NSTimeInterval timeInSeconds = birthdateString.integerValue / 1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInSeconds];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    
    self.birthdate = [formatter stringFromDate:date];
    
    self.playerNameLabel.text = [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
    self.playerIDLabel.text = [NSString stringWithFormat:@"#%@", self.playerID];
    self.birthdateLabel.text = [NSString stringWithFormat:@"born: %@", self.birthdate];
    
    //I want too to have a table within this view holding the teams (and dates hired) that player has been on, that when selected will segue to the appropriate team detail view.  I just need the team detail view first...
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.teamRosters.count;
//    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"teamCell" forIndexPath:indexPath];
    
    NSInteger row = indexPath.row;
    
    NSDictionary *team = self.teamRosters[row];
    
    NSString *hireDateString = team[@"hireDate"];
//    NSString *teamID = team[@"team"][@"teamID"];
    NSString *teamName = team[@"team"][@"teamName"];
    
    NSLog(@"team: %@, hireDate: %@", teamName, hireDateString);
    
    cell.textLabel.text = teamName;
//    cell.detailTextLabel.text = hireDateString;
//    cell.textLabel.text = @"HELLO";
    cell.detailTextLabel.text = @"HI!!!";
    
    return cell;
}

#pragma mark - Navigation

/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //    AMYPlayerDetailViewController *playerDestinationVC = segue.destinationViewController;
    
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    NSInteger row = indexPath.row;
    
    //    playerDestinationVC.player = self.players[row];
}
*/
@end
