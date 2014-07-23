//
//  CreateAccountViewController.h
//  NSUserDefaults, Segues, and Protocols Challenge Solution
//
//  Created by Luis Carbuccia on 7/22/14.
//  Copyright (c) 2014 Luis Carbuccia. All rights reserved.
//

#import <UIKit/UIKit.h>


#define USERNAME @"username"
#define USER_PASSWORD @"password"

@protocol CreateAccountViewControllerDelegate <NSObject>

@required

- (void) didCancel;
- (void) didCreateAccount: (NSMutableDictionary *) addedUserInformation;

@end

@interface CreateAccountViewController : UIViewController

@property (strong, nonatomic) NSMutableDictionary *newUserLoginInformation;
@property (nonatomic) BOOL validUserInput; 

@property (weak, nonatomic) id <CreateAccountViewControllerDelegate> delegate;

@end
