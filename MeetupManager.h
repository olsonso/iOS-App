//
//  MeetupManager.h
//  CDK Interns
//
//  Created by Ong, Matthew on 8/4/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "MeetupManagerDelegate.h"
#import "MeetupCommunicatorDelegate.h"

@class MeetupCommunicator;

@interface MeetupManager : NSObject<MeetupCommunicatorDelegate>
@property (strong, nonatomic) MeetupCommunicator *communicator;
@property (weak, nonatomic) id<MeetupManagerDelegate> delegate;

- (void)fetchGroupsAtCoordinate:(CLLocationCoordinate2D)coordinate;
@end
