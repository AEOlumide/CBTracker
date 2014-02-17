//
//  Price.h
//  CBTrackerApp
//
//  Created by Adedayo Olumide on 1/24/14.
//  Copyright (c) 2014 Adedayo Olumide. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Price : NSObject
@property (nonatomic, strong) NSString *subtotal;
@property (nonatomic, strong) NSString *coinbaseFees;
@property (nonatomic, strong) NSString *bankFees;
@property (nonatomic, strong) NSString *total;
@property (nonatomic, strong) NSString *currency;
- (instancetype)initWithAttributes:(NSDictionary *)attributes;
+ (NSURLSessionDataTask *)globalGetPricesWithBlock:(void (^)(Price *price, NSError *error))block andParameters:(NSDictionary *)parameters;

@end
