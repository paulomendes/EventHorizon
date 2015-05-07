//
//  CLLocationManager+Enhancements.h
//  Easy Taxi
//
//  Created by Paulo Mendes on 4/30/15.
//  Copyright (c) 2015 Easy Taxi. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocationManager (Enhancements)

- (void)simx_didUpdateLocation:(CLLocation *)locations;
- (void)fakeLocation:(CLLocation *)fakeLocation;

@end
