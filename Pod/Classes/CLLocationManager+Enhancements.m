//
//  CLLocationManager+Enhancements.m
//  Easy Taxi
//
//  Created by Paulo Mendes on 4/30/15.
//  Thanks to Colin Eberhardt (http://blog.scottlogic.com/ceberhardt/)
//  Copyright (c) 2015 Easy Taxi. All rights reserved.
//

#import "CLLocationManager+Enhancements.h"
#import "EventHorizon.h"

@implementation CLLocationManager (Enhancements)

- (void)override_onClientEventLocation:(id)foo {
    // no-op - this suppresses location change events that are raised
    // by CLLocationManager
}

- (void)override_startUpdatingLocation {
    // no-op - this suppresses location change events that are raised
    // by CLLocationManager
}

- (void)override_setDelegate:(id<CLLocationManagerDelegate>)delegate {
    [[EventHorizon instance] addManager:self];
    [self override_setDelegate:delegate];
}

- (void)simx_didUpdateLocation:(CLLocation *)location {
    id delegate = self.delegate;
    
    if ([delegate respondsToSelector:@selector(locationManager:didUpdateLocations:)]) {
        [delegate locationManager:self didUpdateLocations:@[location]];
    }
    
    if ([delegate respondsToSelector:@selector(locationManager:didUpdateToLocation:fromLocation:)]) {
        [delegate locationManager:self didUpdateToLocation:location fromLocation:nil];
    }
}

- (void)fakeLocation:(CLLocation *)fakeLocation {
    for (CLLocationManager *locationManager in [[EventHorizon instance] getManagers]) {
        [locationManager simx_didUpdateLocation:fakeLocation];
    }
}

@end
