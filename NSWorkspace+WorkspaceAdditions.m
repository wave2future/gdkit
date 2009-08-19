//copyright 2009 aaronsmith

#import "NSWorkspace+WorkspaceAdditions.h"

@implementation NSWorkspace (WorkspaceAdditions)

- (void) bringApplicationToFront:(NSDictionary *) appInfo {
	if(appInfo == nil) return;
	NSString * appath = [appInfo valueForKey:@"NSApplicationPath"];
	if(appath == nil) return;
	[self launchApplication:appath];
}

- (void) bringCurrentApplicationToFront {
	NSBundle * bndl = [NSBundle mainBundle];
	if(bndl == nil) return;
	[self launchApplication:[bndl bundlePath]];
}

- (void) bringApplicationToFrontFromPath:(NSString *) appPath {
	if(!appPath) return;
	[self launchApplication:appPath];
}

- (void) openSystemPreference:(NSString *) preferencesFileName {
	printf("open system prefs\n");
	NSFileManager * fm = [NSFileManager defaultManager];
	if([fm fileExistsAtPath:[@"/System/Library/PreferencePanes/" stringByAppendingString:preferencesFileName]]) {
		[[NSWorkspace sharedWorkspace] openFile:[@"/System/Library/PreferencePanes/" stringByAppendingString:preferencesFileName]];
	} else if([fm fileExistsAtPath:[@"~/Library/PreferencePanes/" stringByAppendingString:preferencesFileName]]) {
		[[NSWorkspace sharedWorkspace] openFile:[@"~/Library/PreferencePanes/" stringByAppendingString:preferencesFileName]];
	}
}

@end
