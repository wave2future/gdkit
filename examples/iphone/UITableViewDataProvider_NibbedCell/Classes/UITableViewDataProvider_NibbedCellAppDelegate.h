//
//  UITableViewDataProvider_NibbedCellAppDelegate.h
//  UITableViewDataProvider_NibbedCell
//
//  Created by Aaron Smith on 4/16/10.
//  Copyright Mccann Worldgroup 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UITableViewDataProvider_NibbedCellViewController;

@interface UITableViewDataProvider_NibbedCellAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UITableViewDataProvider_NibbedCellViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITableViewDataProvider_NibbedCellViewController *viewController;

@end

