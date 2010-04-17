//
//  UITableViewDataProvider_NibbedCellAppDelegate.m
//  UITableViewDataProvider_NibbedCell
//
//  Created by Aaron Smith on 4/16/10.
//  Copyright Mccann Worldgroup 2010. All rights reserved.
//

#import "UITableViewDataProvider_NibbedCellAppDelegate.h"
#import "UITableViewDataProvider_NibbedCellViewController.h"

@implementation UITableViewDataProvider_NibbedCellAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
