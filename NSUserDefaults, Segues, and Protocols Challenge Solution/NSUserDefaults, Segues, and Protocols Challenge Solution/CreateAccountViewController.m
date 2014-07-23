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

#pragma mark - Lazy Instantiation

- (NSDictionary *)newUserLoginInformation
{
    if (!_newUserLoginInformation)
        _newUserLoginInformation = [[NSMutableDictionary alloc] init];
    
    return _newUserLoginInformation;
}

#pragma mark - IBAction methods

- (IBAction)cancelButtonPressed:(id)sender
{
    //call delegate method for didCancel
    [self.delegate didCancel];
}

- (IBAction)createAccountButtonPressed:(id)sender
{
    // add dictionary object from getUserInformation: to newUserLoginInformation array
    [self.newUserLoginInformation addEntriesFromDictionary:[self getUserInformation]];

    // if user input valid information, go back to login screen
    if (self.validUserInput)
    {
        //call delegate method for didCreateAccount
        [self.delegate didCreateAccount:self.newUserLoginInformation];
    }
}

#pragma mark - Helper Methods

- (NSMutableDictionary *)getUserInformation
{
    // returns a dictionary of the user login information
    
    // instantiate a dictionary object
    NSMutableDictionary *userInformation = [[NSMutableDictionary alloc] init];
    
    // make sure all text fields have text and that the passwords match
    if (self.usernameTextField.text.length != 0 && self.passwordTextfield.text.length != 0 && self.confirmPasswordTextfield.text.length != 0 && [self.passwordTextfield.text isEqualToString:self.confirmPasswordTextfield.text])
    {
        // gather information from text fields
        [userInformation setObject:self.usernameTextField.text forKey:USERNAME];
        [userInformation setObject:self.passwordTextfield.text forKey:USER_PASSWORD];
        
        // user input is valid
        self.validUserInput = YES;
        
    }else if (self.usernameTextField.text.length == 0)
    {
        // if there is no text in username textfield, show notification
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please input a username" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
        
        // user input isn't valid
        self.validUserInput = NO;
    } else if (self.passwordTextfield.text.length == 0)
    {
        // if there is no text in password textfield, notify user
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please input a password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
        
        // user input isn't valid
        self.validUserInput = NO;
    } else if (self.confirmPasswordTextfield.text == 0)
    {
        // if there is no text in confirm password textfield, notify user
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please confirm your password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
        
        // user input isn't valid
        self.validUserInput = NO;
    } else if (![self.passwordTextfield.text isEqualToString:self.confirmPasswordTextfield.text])
    {
        // if the passwords don't match, notify user
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Passwords don't match" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
        
        // user input isn't valid
        self.validUserInput = NO;
    }
    
    return  userInformation;
}

#pragma mark - Delegate Methods

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    return YES; 
}

@end
