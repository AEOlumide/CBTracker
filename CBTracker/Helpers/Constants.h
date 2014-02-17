//
//  Constants.h
//  CBTrackerApp
//
//  Created by Adedayo Olumide on 1/23/14.
//  Copyright (c) 2014 Adedayo Olumide. All rights reserved.
//

#import <Foundation/Foundation.h>
extern NSString* const CbBaseURL;
extern NSString* const SubtotalAmtPath;
extern NSString* const TotalAmtPath;
/**********************Logging*****************/
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define DLog_object( arg ) NSLog( @"Object: %@", arg );
#define DLog_int( arg ) NSLog( @"integer: %i", arg );
#define DLog_float( arg ) NSLog( @"float: %f", arg );
#define DLog_rect( arg ) NSLog( @"CGRect ( %f, %f, %f, %f)", arg.origin.x, arg.origin.y, arg.size.width, arg.size.height );
#define DLog_point( arg ) NSLog( @"CGPoint ( %f, %f )", arg.x, arg.y );
#define DLog_bool( arg ) 	NSLog( @"Boolean: %@", ( arg == YES ? @"YES" : @"NO" ) );

#else
#   define DLog(...)
#endif
// ALog always displays output regardless of the DEBUG setting
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
