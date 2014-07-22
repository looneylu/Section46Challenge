//
//  CreateAccountViewController.m
//  NSUserDefaults, Segues, and Protocols Challenge Solution
//
//  Created by Luis Carbuccia on 7/22/14.
//  Copyright (c) 2014 Luis Carbuccia. All rights reserved.
//

#import "CreateAccountViewController.h"

@interface CreateAccountViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextfield;

@end

@implementation CreateAccountViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.confirmPasswordTextfield.delegate = self;
}

#pragma mark - IBAction methods

- (IBAction)cancelButtonPressed:(id)sender
{

}

- (IBAction)createAccountButtonPressed:(id)sender
{

}

#pragma mark - Delegate Methods

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    return YES; 
}

@end
