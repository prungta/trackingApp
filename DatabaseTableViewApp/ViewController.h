//
//  ViewController.h
//  DatabaseTableViewApp
//
//  Created by Pranay Rungta on 5/24/14.
//  Copyright (c) 2014 hackuci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, HomeModelProtocol>

@property (weak, nonatomic) IBOutlet UITableView *listTableView;

-(IBAction)goToTest:(id)sender;

@end