//
//  UITableViewDataProviderAppDelegate.m
//  UITableViewDataProvider
//
//  Created by Aaron Smith on 4/15/10.
//  Copyright Mccann Worldgroup 2010. All rights reserved.
//

#import "UITableViewDataProviderAppDelegate.h"
#import "UITableViewDataProviderViewController.h"

@implementation UITableViewDataProviderAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
