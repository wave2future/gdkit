
#import "CrashReporterAppDelegate.h"

@implementation CrashReporterAppDelegate
@synthesize window;

- (void) applicationDidFinishLaunching:(NSNotification *) aNotification {
	crashReporter = [[GDCrashReporter alloc] initWithUserDefaultsPrefix:@"TEST"];
	[crashReporter setDeleteCrashReport:true];
	[crashReporter setDelegate:self];
	[crashReporter setCompanyName:@"Mac Endeavor"];
	[crashReporter searchForCrashReports];
	if([crashReporter hasCrash]) {
		[crashReporter show];
	} else {
		
	}
}

- (void) crash:(id) sender {
	[crashReporter forceCrash];
}

- (void) crashReporterDidFinish:(id) sender {
	[crashReporter release];
}

@end
