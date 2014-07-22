//
//  SignInViewController.m
//  NSUserDefaults, Segues, and Protocols Challenge Solution
//
//  Created by Luis Carbuccia on 7/22/14.
//  Copyright (c) 2014 Luis Carbuccia. All rights reserved.
//

#import "SignInViewController.h"
#import "CreateAccountViewController.h"

@interface SignInViewController () <UITextFieldDelegate, CreateAccountViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextfield;

@end

@implementation SignInViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.passwordTextfield.delegate = self;
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
    // hide keyboard
    [self.passwordTextfield resignFirstResponder];
    
    return YES;
}

- (void) didCancel
{
    // dismiss CreateAccountViewController without saving any information
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) didCreateAccount
{
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    if ([segue.destinationViewController isKindOfClass:[CreateAccountViewController class]])
    {
        // make an instance of CreateAccountViewController and designate it as a delegate
        CreateAccountViewController *createAccountVC = segue.destinationViewController;
        
        createAccountVC.delegate = self; 
    }
}


@end
