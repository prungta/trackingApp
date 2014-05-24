//
//  DetailViewController.h
//  DatabaseTableViewApp
//
//  Created by Pranay Rungta on 5/24/14.
//  Copyright (c) 2014 hackuci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Location.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) Location *selectedLocation;

@end
