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

@end

@implementation AMYPlayerDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.birthdate = self.player[0];
//    self.firstName = self.player[1];
//    self.lastName = self.player[2];
//    self.playerID = self.player[3];
    
//    self.playerNameLabel.text = [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
//    self.playerIDLabel.text = [NSString stringWithFormat:@"%@", self.playerID];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
