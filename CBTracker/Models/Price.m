//
//  Price.m
//  CBTrackerApp
//
//  Created by Adedayo Olumide on 1/24/14.
//  Copyright (c) 2014 Adedayo Olumide. All rights reserved.
//

#import "Price.h"
#import "LoadPricesClient.h"
@implementation Price
- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    id fees = [attributes objectForKey:@"fees"];
    for (id feeType in fees) {
        if ([feeType isKindOfClass:[NSDictionary class]]) {
            NSArray *keys = [feeType allKeys];
            for (id key in keys) {
                if ([key isKindOfClass:[NSString class]] && [(NSString *) key isEqualToString:@"bank"]) {
                    self.bankFees = [[feeType objectForKey:key] objectForKey:@"amount"];
                }
                else if ([key isKindOfClass:[NSString class]] && [(NSString *) key isEqualToString:@"coinbase"]) {
                    self.coinbaseFees = [[feeType objectForKey:key] objectForKey:@"amount"];
                }
            }
        }
    }
    
    id subtotal = [attributes valueForKeyPath:SubtotalAmtPath];//subtotal is the currentmarket price
    if (![subtotal isEqualToString:nil]) {
        DLog(@"ob: %@ type: %@", subtotal , [subtotal class]);
        self.subtotal = subtotal;
    }
    
    id total = [attributes valueForKeyPath:TotalAmtPath];
    if (![total isEqualToString:nil]) {
        DLog(@"ob: %@ type: %@", total , [total class]);
        self.total = total;
    }

    return self;
}

+ (NSURLSessionDataTask *)globalGetPricesWithBlock:(void (^)(Price *price, NSError *error))block andParameters:(NSDictionary *)parameters {
    return [[LoadPricesClient sharedInstance] GET:@"prices/buy" parameters:parameters success:^(NSURLSessionDataTask * __unused task, id JSON) {
        DLog(@"json: %@",JSON);
        Price *price = [[Price alloc] initWithAttributes:JSON];
        if (block) {
            block(price, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}


@end