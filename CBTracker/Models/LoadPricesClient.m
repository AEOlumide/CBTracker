//
//  LoadPricesClient.m
//  CBTrackerApp
//
//  Created by Adedayo Olumide on 1/24/14.
//  Copyright (c) 2014 Adedayo Olumide. All rights reserved.
//

#import "LoadPricesClient.h"

@implementation LoadPricesClient
static LoadPricesClient *sharedInstance = nil;

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[LoadPricesClient alloc] initWithBaseURL:[NSURL URLWithString:CbBaseURL]];
    });

    return sharedInstance;
}
@end
