
#import <UIKit/UIKit.h>

@class UITableDataSourceControllerViewController;

@interface UITableDataSourceControllerAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	UITableDataSourceControllerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITableDataSourceControllerViewController *viewController;

@end

