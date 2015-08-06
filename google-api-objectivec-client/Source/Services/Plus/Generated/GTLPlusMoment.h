/* Copyright (c) 2015 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//
//  GTLPlusMoment.h
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   Google+ API (plus/v1)
// Description:
//   The Google+ API enables developers to build on top of the Google+ platform.
// Documentation:
//   https://developers.google.com/+/api/
// Classes:
//   GTLPlusMoment (0 custom class methods, 7 custom properties)

#if GTL_BUILT_AS_FRAMEWORK
  #import "GTL/GTLObject.h"
#else
  #import "GTLObject.h"
#endif

@class GTLPlusItemScope;

// ----------------------------------------------------------------------------
//
//   GTLPlusMoment
//

@interface GTLPlusMoment : GTLObject

// The moment ID.
// identifier property maps to 'id' in JSON (to avoid Objective C's 'id').
@property (nonatomic, copy) NSString *identifier;

// Identifies this resource as a moment.
@property (nonatomic, copy) NSString *kind;

// The object on which the action was performed. Specifying this is equivalent
// with specifying "target". Note that responses from the server will use the
// "target" field instead for backward-compatibility with older clients.
@property (nonatomic, retain) GTLPlusItemScope *object;

// The object generated by performing the action on the object. For example, a
// user writes a review of a restaurant, the object is the restaurant and the
// result is the review.
@property (nonatomic, retain) GTLPlusItemScope *result;

// Time stamp of when the action occurred in RFC3339 format.
@property (nonatomic, retain) GTLDateTime *startDate;

// The object on which the action was performed.
@property (nonatomic, retain) GTLPlusItemScope *target;

// The schema.org type for the type of moment to write. For example,
// http://schema.org/AddAction. Note that responses from the server will use the
// Google schema type instead for backward-compatibility with older clients. For
// example, http://schemas.google.com/AddActivity.
@property (nonatomic, copy) NSString *type;

@end
