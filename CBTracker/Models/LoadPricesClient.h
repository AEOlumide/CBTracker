//
//  LoadPricesClient.h
//  CBTrackerApp
//
//  Created by Adedayo Olumide on 1/24/14.
//  Copyright (c) 2014 Adedayo Olumide. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface LoadPricesClient : AFHTTPSessionManager
+ (instancetype)sharedInstance;
@end
