//
//  WindowController.h
//  ASHStatusItemPopover
//
//  Created by Adam Hartford on 12/19/13.
//  Copyright (c) 2013 Adam Hartford. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface WindowController : NSWindowController
@property (nonatomic, copy) void (^pricesDidLoad)(NSString *price);
-(void)loadPrices;
@end
