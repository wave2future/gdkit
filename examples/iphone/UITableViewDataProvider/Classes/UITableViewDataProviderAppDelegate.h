//
//  UITableViewDataProviderAppDelegate.h
//  UITableViewDataProvider
//
//  Created by Aaron Smith on 4/15/10.
//  Copyright Mccann Worldgroup 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UITableViewDataProviderViewController;

@interface UITableViewDataProviderAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UITableViewDataProviderViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITableViewDataProviderViewController *viewController;

@end

