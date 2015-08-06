//
//  GroupBuilder.h
//  CDK Interns
//
//  Created by Ong, Matthew on 8/4/15.
//  Copyright (c) 2015 CDK Global, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupBuilder : NSObject
+ (NSArray *)groupsFromJSON:(NSData *)objectNotation error:(NSError **)error;

@end
