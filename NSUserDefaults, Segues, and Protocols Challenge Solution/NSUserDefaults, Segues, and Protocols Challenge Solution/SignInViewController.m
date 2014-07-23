//
//  SignInViewController.m
//  NSUserDefaults, Segues, and Protocols Challenge Solution
//
//  Created by Luis Carbuccia on 7/22/14.
//  Copyright (c) 2014 Luis Carbuccia. All rights reserved.
//

#import "SignInViewController.h"
#import "CreateAccountViewController.h"
#import "LRCViewController.h"

#define USER_INFORMATION @"User login information"

@interface SignInViewController () <UITextFieldDelegate, CreateAccountViewControllerDelegate, LRCViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (strong, nonatomic) IBOutlet UIButton *logInButton;

@property (strong, nonatomic) NSMutableArray *users;

@end

@implementation SignInViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // fill users array with NSUserDefaults
    [self.users addObjectsFromArray:[[NSUserDefaults standardUserDefaults] objectForKey:USER_INFORMATION]];
    
    // password textfield responds to delegate methods
    self.passwordTextfield.delegate = self;
}

#pragma mark - IBAction methods

- (IBAction)logInButtonPressed:(id)sender
// when log in button is pressed, perform segue to ViewController view
{
    // iterate through users array which holds dictionary objects
    for (NSDictionary *comparisonDictionary in self.users)
    {
        // if user in put matches any of the dictionaries in user array
        if ([self.usernameTextField.text isEqualToString:[comparisonDictionary objectForKey:USERNAME]] && [self.passwordTextfield.text isEqualToString:[comparisonDictionary objectForKey:USER_PASSWORD]])
            // perform segue
            [self performSegueWithIdentifier:@"toViewControllerSegue" sender:sender];
    }

}

- (IBAction)createAccountButtonPressed:(id)sender
{
    // when create account button is pressed, perform segue to createAccountViewController view
    [self performSegueWithIdentifier:@"toCreateAccountSegue" sender:sender];
}

#pragma mark - Lazy Instantiation

- (NSMutableArray *)users
{
    if (!_users)
        _users = [[NSMutableArray alloc] init];
    
    return _users;
}

#pragma mark - Delegate Methods

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    // iterate through users array which holds dictionary objects
    for (NSDictionary *comparisonDictionary in self.users)
    {
        // if user in put matches any of the dictionaries in user array
        if ([self.usernameTextField.text isEqualToString:[comparisonDictionary objectForKey:USERNAME]] && [self.passwordTextfield.text isEqualToString:[comparisonDictionary objectForKey:USER_PASSWORD]])
            // perform segue
            [self performSegueWithIdentifier:@"toViewControllerSegue" sender:nil];
    }
    // hide keyboard
    [self.passwordTextfield resignFirstResponder];
    
    return YES;
}

- (void) didCancel
{
    // dismiss CreateAccountViewController without saving any information
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) didCreateAccount:(NSMutableDictionary *)addedUserInformation
{
    // add new user information to users array
    [self.users addObject:addedUserInformation];
    
    // dismiss CreateAccountViewController 
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // persist information with NSUserDefaults
    [[NSUserDefaults standardUserDefaults] setObject:self.users forKey:USER_INFORMATION];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)logOut
{
    // dismiss LRCViewController
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    
    // CreateAccountViewController view
    if ([segue.destinationViewController isKindOfClass:[CreateAccountViewController class]])
    {
        // make an instance of CreateAccountViewController and designate it as a delegate
        CreateAccountViewController *createAccountVC = segue.destinationViewController;
        
        createAccountVC.delegate = self;
    }
    
    // LRCViewController view
    if ([segue.destinationViewController isKindOfClass:[LRCViewController class]])
    {
        // make an instance of LRCViewController and designate it as a delegate
        LRCViewController *nextView = segue.destinationViewController;
        
        // pass user login information to next view
        nextView.username = self.usernameTextField.text;
        nextView.password = self.passwordTextfield.text;
        
        nextView.delegate = self;
    }

}


@end
