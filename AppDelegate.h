//
//  AppDelegate.h
//  CDK Interns
//
//  Created by Ong, Matthew on 8/4/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CLLocationManager *locationManager;

@end
