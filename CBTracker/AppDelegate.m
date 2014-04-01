//
//  AppDelegate.m
//  ASHStatusItemPopover
//
//  Created by Adam Hartford on 12/19/13.
//  Copyright (c) 2013 Adam Hartford. All rights reserved.
//

#import "AppDelegate.h"

#import "ASHStatusItemPopover.h"
#import "WindowController.h"

@interface AppDelegate()
@property (nonatomic, strong) ASHStatusItemPopover *statusItemPopover;
@property (nonatomic, strong) WindowController *windowController;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    
    self.statusItemPopover = [[ASHStatusItemPopover alloc] init];
    
    self.windowController = [[WindowController alloc] initWithWindowNibName:@"WindowController"];
    self.statusItemPopover.windowController = self.windowController;

    self.statusItemPopover.image = [NSImage imageNamed:@"statusImage"];
    self.statusItemPopover.alternateImage = [NSImage imageNamed:@"alternateImage"];

    [self.statusItemPopover setupTitle:@"$0.00"];
    
    __weak typeof(self) weakSelf = self;
    self.statusItemPopover.popoverWillShow = ^{
        DLog(@"Popover will show");
        [weakSelf.windowController loadPrices];
    };
    
    self.statusItemPopover.popoverDidShow = ^{
        DLog(@"Popover did show");
    };
    
    self.statusItemPopover.popoverWillClose = ^{
        DLog(@"Popover will close");
    };
    
    self.statusItemPopover.popoverDidClose = ^{
        DLog(@"Popover did close");
    };
    
    [self.windowController loadPrices];
    
    self.windowController.pricesDidLoad = ^(NSString *price) {
        [weakSelf.statusItemPopover setupTitle:[NSString stringWithFormat:@"$%@",price]];
    };
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeWindow) name:NSWindowDidResignKeyNotification object:[self window]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeWindow) name:NSWindowDidResignMainNotification object:[self window]];    

}

-(void)closeWindow
{
    if ([self.statusItemPopover active]) {
        [self.statusItemPopover mouseDown:nil];
    }
}
@end
