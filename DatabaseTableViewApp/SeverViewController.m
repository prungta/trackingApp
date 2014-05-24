//
//  SeverViewController.m
//  DatabaseTableViewApp
//
//  Created by Pranay Rungta on 5/24/14.
//  Copyright (c) 2014 hackuci. All rights reserved.
//

#import "SeverViewController.h"

@interface SeverViewController ()

@end

@implementation SeverViewController

int invalidTrys = 0;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)login:(id)sender{
    if([_usernameField.text isEqualToString:@""])
       _invalidLoginMsg.hidden = false;
    
    NSString *strURL = [NSString stringWithFormat:@"http://pranayrungta.com/login.php?userName=%@&password=%@",_usernameField.text, _passwordField.text];

    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];

    NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];

    
    NSLog(strResult);
    
    if ([strResult isEqualToString:@"1"])
    {
        NSLog(@"Worked");
        
//        if(sqlite3_open()
//        
    }else
    {
//        // invalid information annoy popup
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"alert" message:@"Invalide Information" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
//        return;
        
        _invalidLoginMsg.hidden = false;
        NSString *string = [NSString stringWithFormat:@"%d", invalidTrys];

        _invalidLoginMsg.text = [@"Invalid Login " stringByAppendingString:(string)];
        
        invalidTrys++;
    }
}

@end
