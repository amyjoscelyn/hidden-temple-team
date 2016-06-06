//
//  AMYTeamDetailViewController.m
//  HiddenTempleTeam
//
//  Created by Amy Joscelyn on 6/1/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYTeamDetailViewController.h"
#import "CAGradientLayer+Gradients.h"

@interface AMYTeamDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSString *teamName;
@property (nonatomic, strong) NSString *teamID;
@property (nonatomic, strong) NSArray *teamRosters;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@property (weak, nonatomic) IBOutlet UILabel *teamNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *teamIDLabel;
@property (weak, nonatomic) IBOutlet UIImageView *teamImage;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AMYTeamDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    NSLog(@"team: %@", self.team);
    
    self.teamName = self.team[@"teamName"];
    self.teamID = self.team[@"teamID"];
    self.teamRosters = self.team[@"teamRosters"];
    
    self.teamNameLabel.text = [NSString stringWithFormat:@"%@", self.teamName];
    self.teamIDLabel.text = [NSString stringWithFormat:@"team #%@", self.teamID];
    
    NSSortDescriptor *sortByDateDesc = [NSSortDescriptor sortDescriptorWithKey:@"hireDate" ascending:NO];
    self.teamRosters = [self.teamRosters sortedArrayUsingDescriptors:@[sortByDateDesc]];
    
    [self displayTeamImage];
    self.teamImage.layer.borderWidth = 2;
    self.teamImage.layer.borderColor = [UIColor brownColor].CGColor;
    
    [self setBackgroundColor];
}

- (void)setBackgroundColor
{
    self.gradientLayer = [CAGradientLayer yellowToBrownGradient];
    self.gradientLayer.frame = self.view.frame;
    [self.view.layer insertSublayer:self.gradientLayer atIndex:0];
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
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"playerCell" forIndexPath:indexPath];
    
    NSInteger row = indexPath.row;
    
    NSDictionary *player = self.teamRosters[row];
    
    NSString *hireDateString = player[@"hireDate"];
    NSString *firstName = player[@"player"][@"firstName"];
    NSString *lastName = player[@"player"][@"lastName"];
//    NSString *playerID = player[@"player"][@"playerID"];
    
    NSString *fullName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
    
    NSTimeInterval timeInSeconds = hireDateString.integerValue / 1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInSeconds];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    
    NSString *dateString = [formatter stringFromDate:date];
    
    cell.textLabel.text = fullName;
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
