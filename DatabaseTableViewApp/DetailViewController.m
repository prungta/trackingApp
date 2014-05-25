//
//  DetailViewController.m
//  DatabaseTableViewApp
//
//  Created by Pranay Rungta on 5/24/14.
//  Copyright (c) 2014 hackuci. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

CLLocationManager *locationManager;
float latitude, longitude;

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
    NSLog(@"MAP LOADED");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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

- (void)viewDidAppear:(BOOL)animated
{
    
    
    
    // Create coordinates from location lat/long
    CLLocationCoordinate2D poiCoodinates;
    poiCoodinates.latitude = [self.selectedLocation.latitude doubleValue];
    poiCoodinates.longitude= [self.selectedLocation.longitude doubleValue];
    
    CLLocationCoordinate2D myCoordinates;
    myCoordinates.latitude = latitude;
    myCoordinates.longitude = longitude;
    
   
    
   // MKMapRect theirRect = MKMapRectMake(poiCoodinates.latitude, poiCoodinates.longitude, 0, 0);
//MKMapRect myRect = MKMapRectMake(latitude, longitude, 0, 0);
    
    //printf("%f %f\n", theirRect.origin.x, theirRect.origin.y);
    //printf("%f %f\n", myRect.origin.x, myRect.origin.y);

    
   // MKMapRect zoomRect = MKMapRectUnion(theirRect, myRect);
    
    CLLocationCoordinate2D midCoordinates;
    midCoordinates.latitude = (poiCoodinates.latitude + latitude)/2;
    midCoordinates.longitude = (poiCoodinates.longitude + longitude)/2;
    
    // Zoom to region
    // poiCoodinates.longitude, myCoordinates.latitude
    
    float maxLongitude = MAX(poiCoodinates.longitude + 180, myCoordinates.longitude + 180);
    float minLongitude = MIN(poiCoodinates.longitude + 180, myCoordinates.longitude + 180);

    float maxLatitude = MAX(poiCoodinates.latitude + 90, myCoordinates.latitude + 90);
    float minLatitude = MIN(poiCoodinates.latitude + 90, myCoordinates.latitude + 90);
    
    
    float height = maxLongitude - minLongitude;
    float width = maxLatitude - minLatitude;
    
    float max = MAX(height, width);
    
    MKCoordinateSpan span;
    span.latitudeDelta = max;
    span.longitudeDelta = max;
    
    printf("%f %f\n", width, height);
    
    //MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(midCoordinates, );
    

    [self.mapView setRegion:MKCoordinateRegionMake(midCoordinates, span) animated:YES];
//    
//    [self.mapView setVisibleMapRect:zoomRect animated:YES];
//    printf("%f %f\n",zoomRect.origin.x, zoomRect.origin.y);
    
    // Plot pins
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = poiCoodinates;
    
    MKPointAnnotation *mypin = [[MKPointAnnotation alloc] init];
    mypin.coordinate = myCoordinates;
    
    [self.mapView addAnnotation:pin];
    [self.mapView addAnnotation:mypin];

    
}

@end
