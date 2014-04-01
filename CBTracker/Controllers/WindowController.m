//
//  WindowController.m
//  ASHStatusItemPopover
//
//  Created by Adam Hartford on 12/19/13.
//  Copyright (c) 2013 Adam Hartford. All rights reserved.
//

#import "WindowController.h"
#import "Price.h"

@interface WindowController()
@property (strong) IBOutlet NSTextField *quantityField;
@property (strong) IBOutlet NSTextField *marketPriceField;
@property (strong) IBOutlet NSTextField *coinbaseFeeField;
@property (strong) IBOutlet NSTextField *bankFeeField;
@property (strong) IBOutlet NSTextField *totalField;

@end

@implementation WindowController

- (void)loadPrices {
    if ([self.quantityField.stringValue length] == 0) {
        self.quantityField.stringValue = @"1.0";
    }
    
    NSDictionary *parameters = @{@"qty" : [NSNumber numberWithFloat:[self.quantityField.stringValue floatValue]],
                                 @"currency" : @"USD"};//load from NSUserDefaults
    
    [Price globalGetPricesWithBlock:^(Price *price, NSError *error) {
        if (error) {
            DLog(@"%@",NSLocalizedString(@"Error1", nil));
        }
        else{
            [self setTextFieldValues:price];
            _pricesDidLoad(price.total);
        }
        DLog(@"total price: %@",price.total);
        
    } andParameters:parameters];
    
}

- (void)setTextFieldValues:(Price *)price {
    [self.marketPriceField setStringValue:[NSString stringWithFormat:NSLocalizedString(@"Subtotal: $%@", @"{Current Market Rate}"), price.subtotal]];
    [self.coinbaseFeeField setStringValue:[NSString stringWithFormat:NSLocalizedString(@"Coinbase Fee: $%@", @"{Coinbase Fee}"), price.coinbaseFees]];
    [self.bankFeeField setStringValue:[NSString stringWithFormat:NSLocalizedString(@"Bank Fee: $%@", @"{Bank Fees}"), price.bankFees]];
    [self.totalField setStringValue:[NSString stringWithFormat:NSLocalizedString(@"Total: $%@", @"{Total Price}"), price.total]];
}

- (IBAction)updateButtonClicked:(id)sender {
    [self loadPrices];
}
@end
