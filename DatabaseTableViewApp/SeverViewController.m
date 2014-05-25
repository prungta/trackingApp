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

CLLocationManager *locationManager;
int invalidTrys = 0;
float latitude;
float longitude;

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
    
    // Build the path to the database file
    _databasePath = @"http://pranayrungta.com";
    // Do any additional setup after loading the view, typically from a nib.
    locationManager = [[CLLocationManager alloc] init];
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    
//    NSLog(@"SEVER SEUGE");
//}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        latitude = currentLocation.coordinate.latitude;
        longitude = currentLocation.coordinate.longitude;
    }
}


-(IBAction)registration:(id)sender
{
    
    NSString *strURL = [NSString stringWithFormat:@"http://pranayrungta.com/add.php?userName=%@&password=%@&latitude=%f&longitude=%f",_usernameField.text, _passwordField.text,latitude,longitude];
    
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    
    NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
    
    
    printf("@@@@@@@@@@@   RESULT: %s\n", [strResult UTF8String]);
    
    if ([strResult isEqualToString:@"1"])
    {
        NSLog(@"Registration Worked");
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"navController"];
                                      
        [self presentViewController:vc animated:YES completion:nil];
    }
    
    
}

-(IBAction)login:(id)sender{
    if([_usernameField.text isEqualToString:@""])
       _invalidLoginMsg.hidden = false;
    
    NSString *strURL = [NSString stringWithFormat:@"http://pranayrungta.com/login.php?userName=%@&password=%@",_usernameField.text, _passwordField.text];

    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];

    NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];

    if ([strResult isEqualToString:@"1"])
    {
        NSLog(@"Worked");
        // Alive
        NSString *strURL = [NSString stringWithFormat:@"http://pranayrungta.com/login.php?userName=%@&password=%@",_usernameField.text, _passwordField.text];
        
        NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
        
        NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
        
        // Go Back
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"navController"];
        
        [self presentViewController:vc animated:YES completion:nil];
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
