//
//  EventHorizon.m
//  Pods
//
//  Created by Paulo Mendes on 5/7/15.
//  Thanks to Colin Eberhardt (http://blog.scottlogic.com/ceberhardt/)
//

#import "EventHorizon.h"
#import "EVHSwizzleUtils.h"
#import "CLLocationManager+Enhancements.h"

@interface EventHorizon ()

@property (nonatomic, strong) NSMutableArray *managers;

@end

@implementation EventHorizon

- (instancetype)init {
    self = [super init];
    if (self) {
        self.managers = [NSMutableArray array];
    }
    return self;
}

+ (EventHorizon *)instance {
    static EventHorizon *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[EventHorizon alloc] init];
    });
    return instance;
}

- (NSArray *)getManagers {
    NSMutableArray *managers = [NSMutableArray new];
    NSMutableArray *nilReferences = [NSMutableArray new];
    for (NSValue *nonRetainedManager in _managers) {
        id manager = [nonRetainedManager nonretainedObjectValue];
        if (manager != nil) {
            [managers addObject:manager];
        } else {
            [nilReferences addObject:nonRetainedManager];
        }
    }
    [_managers removeObjectsInArray:nilReferences];
    return managers;
}

- (void)addManager:(id)manager {
    for (NSValue *nonRetainedManager in self.managers) {
        id existingManager = [nonRetainedManager nonretainedObjectValue];
        if (manager == existingManager) {
            return;
        }
    }
    
    NSValue *nonRetainedManager = [NSValue valueWithNonretainedObject:manager];
    [self.managers addObject:nonRetainedManager];
}

- (void)enable {
    [EVHSwizzleUtils swizzleClass:[CLLocationManager class] method:@"setDelegate:"];
    [EVHSwizzleUtils swizzleClass:[CLLocationManager class] method:@"onClientEventLocation:"];
}

- (void)fakeLocation:(CLLocation *)fakeLocation {
    for (CLLocationManager *locationManager in [[EventHorizon instance] getManagers]) {
        [locationManager simx_didUpdateLocation:fakeLocation];
    }
}

@end
