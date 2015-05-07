//
//  EventHorizon.h
//  Pods
//
//  Created by Paulo Mendes on 5/7/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface EventHorizon : NSObject

+ (EventHorizon *)instance;

- (NSArray *)getManagers;
- (void)addManager:(id)manager;
- (void)enable;

- (void)fakeLocation:(CLLocation *)fakeLocation;

@end
