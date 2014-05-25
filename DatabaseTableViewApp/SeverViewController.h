//
//  SeverViewController.h
//  DatabaseTableViewApp
//
//  Created by Pranay Rungta on 5/24/14.
//  Copyright (c) 2014 hackuci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
#import <CoreLocation/CoreLocation.h>

@interface SeverViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UILabel *invalidLoginMsg;
@property (weak, nonatomic) IBOutlet UIButton *registration;
@property (nonatomic) sqlite3 *contactDB;
@property (strong, nonatomic) NSString *databasePath;


-(IBAction)login:(id)sender;

@end
