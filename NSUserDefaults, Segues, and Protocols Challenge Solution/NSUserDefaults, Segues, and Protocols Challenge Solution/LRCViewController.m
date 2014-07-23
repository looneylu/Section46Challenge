//
//  LRCViewController.m
//  NSUserDefaults, Segues, and Protocols Challenge Solution
//
//  Created by Luis Carbuccia on 7/22/14.
//  Copyright (c) 2014 Luis Carbuccia. All rights reserved.
//

#import "LRCViewController.h"

@interface LRCViewController ()

@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *passwordLabel;

@end

@implementation LRCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // display user information on screen
    self.usernameLabel.text = self.username;
    self.passwordLabel.text = self.password;
}


- (IBAction)logOutButtonPressed:(id)sender
{
    // call delegate logOut method
    [self.delegate logOut];
}


@end
