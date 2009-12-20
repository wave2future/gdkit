
#import "Test1AppDelegate.h"

@implementation Test1AppDelegate

- (void) initApplication {
	GDApplicationInfo * app = [GDApplicationInfo instanceFromDefaultPlist];
	TMainMenuController * mm = [[[TMainMenuController alloc] init] autorelease];
	TModalController * mdls = [[[TModalController alloc] init] autorelease];
	TOperationsController * ops = [[[TOperationsController alloc] init] autorelease];
	TSoundController * snds = [[[TSoundController alloc] init] autorelease];
	[self lazyInitWithAppInfo:app mainMenu:mm modals:mdls operations:ops viewController:views sounds:snds];
	[super initApplication];
}

- (void) initApplicationInfo {
	NSLog(@"initApplicationInfo");
	//NSLog(@"info: %@",[self appInfo]);
}

- (void) initDelegates {
	NSLog(@"initDelegates");
	NSLog(@"%@",windowDelegate);
	[super initDelegates];
}

- (void) initWindows {
	NSLog(@"initWindows");
	[super initWindows];
}

- (void) initViews {
	NSLog(@"initViews");
	[[views customView1] lazyInitWithGDApplicationController:self];
	[super initViews];
}

- (void) startApplication {
	NSLog(@"start app");
	[views showCustomView1];
	[mainMenu logAMenuItem];
	[sounds pop];
	[operations doSomething];
	GDCallback * callback=[[GDCallback alloc] initWithTarget:self andAction:@selector(onSomethingComplete)];
	[operations doSomethingWithCallback:callback];
	[callback release];
}

- (void) onSomethingComplete {
	NSLog(@"something complete");
}

@end
