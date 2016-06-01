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
    
    NSString *dateString = self.player[@"birthdate"];
    self.firstName = self.player[@"firstName"];
    self.lastName = self.player[@"lastName"];
    self.playerID = self.player[@"playerID"];
    
    NSInteger timeInSeconds = dateString.integerValue;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInSeconds];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd:MM:yy"];
    
    self.birthdate = [formatter stringFromDate:date];
    
    self.playerNameLabel.text = [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
    self.playerIDLabel.text = [NSString stringWithFormat:@"%@", self.playerID];
    self.birthdateLabel.text = [NSString stringWithFormat:@"birthdate: %@", self.birthdate];
    
    //I want too to have a table within this view holding the teams (and dates hired) that player has been on, that when selected will segue to the appropriate team detail view.  I just need the team detail view first...
}

/*
 Okay.  I don't have my internet okayed for home here.  But that doesn't mean I can't still work on these projects just because the database is down!
 I can set up the frameworks the database will be displayed on for both Java and Obj-C.
 
 In XCode, I can expand the Storyboard to include the different table tabs, copying the code over and setting them with strict comments of what I've changed so that when I get back to internet I can test them individually to make sure they work like they're supposed to.
 
 For Java, I can draft an html file, see how to set up the date formatting (maybe I can get that to work in Objective-C too), and start a css file.  I can even try to write the html/css file with Bootstrap in mind.
 
 I can also go through more of the Bootstrap tutorial, or maybe even start the Javascript one.  Get a head start, you know?
 
 I'll reconvene with my thoughts at lunch and see where things go from there.
 
 Or maybe I can just ask Fabio to authenticate this wi-fi, although I'm not entirely certain that's possible.
 
 Break!
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
