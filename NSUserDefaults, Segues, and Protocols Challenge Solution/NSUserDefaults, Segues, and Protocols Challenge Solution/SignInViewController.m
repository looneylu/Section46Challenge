//
//  SignInViewController.m
//  NSUserDefaults, Segues, and Protocols Challenge Solution
//
//  Created by Luis Carbuccia on 7/22/14.
//  Copyright (c) 2014 Luis Carbuccia. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextfield;

@end

@implementation SignInViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - IBAction methods

- (IBAction)logInButtonPressed:(id)sender
{
    // when log in button is pressed, perform segue to ViewController view
    [self performSegueWithIdentifier:@"toViewControllerSegue" sender:sender];
}

- (IBAction)createAccountButtonPressed:(id)sender
{
    // when create account button is pressed, perform segue to createAccountViewController view
    [self performSegueWithIdentifier:@"toCreateAccountSegue" sender:sender];
}

#pragma mark - Delegate Methods

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
