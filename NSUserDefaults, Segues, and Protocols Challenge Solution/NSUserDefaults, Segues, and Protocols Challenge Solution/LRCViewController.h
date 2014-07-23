//
//  LRCViewController.h
//  NSUserDefaults, Segues, and Protocols Challenge Solution
//
//  Created by Luis Carbuccia on 7/22/14.
//  Copyright (c) 2014 Luis Carbuccia. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LRCViewControllerDelegate <NSObject>

@required

- (void)logOut;

@end

@interface LRCViewController : UIViewController

@property (weak, nonatomic) id <LRCViewControllerDelegate> delegate;
@property (strong,nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password; 

@end
