//
//  EVHViewController.m
//  EventHorizon
//
//  Created by Paulo Mendes on 05/07/2015.
//  Copyright (c) 2014 Paulo Mendes. All rights reserved.
//

#import "EVHViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "EventHorizon.h"

#define METERS_PER_MILE 1609.344

@interface EVHViewController () <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;

@end

@implementation EVHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // This is the Catch!!!
    [[EventHorizon instance] enable];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    [self.locationManager startUpdatingLocation];
}

#pragma mark - Actions

- (IBAction)fakeItButtonAction:(id)sender {
    NSInteger lat = [self.latitudeTextField.text integerValue];
    NSInteger lng = [self.longitudeTextField.text integerValue];
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:lat longitude:lng];
    [[EventHorizon instance] fakeLocation:location];
}

#pragma mark - CLLocationManagerDelegate Implementation

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations firstObject];
    
    NSLog(@"lat: %@  lng: %@", @(location.coordinate.latitude), @(location.coordinate.longitude));
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    [self.map setRegion:viewRegion animated:YES];
}

@end
