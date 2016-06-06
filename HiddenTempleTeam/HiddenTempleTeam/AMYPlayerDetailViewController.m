//
//  AMYPlayerDetailViewController.m
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 5/31/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYPlayerDetailViewController.h"
#import "CAGradientLayer+Gradients.h"

@interface AMYPlayerDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *birthdate;
@property (nonatomic, strong) NSString *playerID;
@property (nonatomic, strong) NSArray *teamRosters;

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@property (weak, nonatomic) IBOutlet UILabel *playerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthdateLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AMYPlayerDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    NSString *birthdateString = self.player[@"birthdate"];
    self.firstName = self.player[@"firstName"];
    self.lastName = self.player[@"lastName"];
    self.playerID = self.player[@"playerID"];
    self.teamRosters = self.player[@"teamRosters"];
    
    NSTimeInterval timeInSeconds = birthdateString.integerValue / 1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInSeconds];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    
    self.birthdate = [formatter stringFromDate:date];
    
    self.playerNameLabel.text = [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
    self.playerIDLabel.text = [NSString stringWithFormat:@"#%@", self.playerID];
    self.birthdateLabel.text = [NSString stringWithFormat:@"born: %@", self.birthdate];
    
    [self setBackgroundColor];
}

- (void)setBackgroundColor
{
    self.gradientLayer = [CAGradientLayer yellowToBrownGradient];
    self.gradientLayer.frame = self.view.frame;
    [self.view.layer insertSublayer:self.gradientLayer atIndex:0];
    
//    self.tableView.backgroundColor = [UIColor brownColor];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.teamRosters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"teamCell" forIndexPath:indexPath];
    
    NSInteger row = indexPath.row;
    
    NSDictionary *team = self.teamRosters[row];
    
    NSString *hireDateString = team[@"hireDate"];
//    NSString *teamID = team[@"team"][@"teamID"];
    NSString *teamName = team[@"team"][@"teamName"];
    
    NSTimeInterval timeInSeconds = hireDateString.integerValue / 1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInSeconds];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    
    NSString *dateString = [formatter stringFromDate:date];
    
    NSLog(@"team: %@, hireDate: %@", teamName, dateString);
    
    cell.textLabel.text = teamName;
    cell.detailTextLabel.text = dateString;
    
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
