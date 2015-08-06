//
//  AppDelegate.m
//  CDK Interns
//
//  Created by Ong, Matthew on 8/4/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<CLLocationManagerDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.locationManager = [[CLLocationManager alloc] init];
    if ([CLLocationManager locationServicesEnabled]) {
        [self.locationManager setDelegate:self];
        [self.locationManager startUpdatingLocation];
    }
    
    return YES;
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusAuthorized) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"kCLAuthorizationStatusAuthorized" object:self];
    }
}

@end
