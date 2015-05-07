//
//  EVHAppDelegate.m
//  EventHorizon
//
//  Created by CocoaPods on 05/07/2015.
//  Copyright (c) 2014 Paulo Mendes. All rights reserved.
//

#import "EVHAppDelegate.h"
#import <CoreLocation/CoreLocation.h>

@interface CLLocationManager()

+ (void)setAuthorizationStatus:(BOOL)status
           forBundleIdentifier:(NSString *)bundleIdentifier;

@end

@implementation EVHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [CLLocationManager setAuthorizationStatus:YES forBundleIdentifier:[[NSBundle mainBundle] bundleIdentifier]];
    return YES;
}

@end
