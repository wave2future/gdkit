
#import "GDCrashReporterAppDelegate.h"
#import <GDKit/GDKit.h>

static NSString * crashedAppName = NULL;
static NSString * crashedAppBundleId = NULL;
static NSString * crashedAppBundlePath = NULL;
static NSString * crashedAppDefaults = NULL;
static NSString * crashReporterWindowTitle = NULL;
static NSString * crashReporterTitle = NULL;
static NSString * crashReporterIgnore = NULL;
static NSString * content = NULL;
static NSWorkspace * workspace;
static NSUserDefaults * defaults;

@implementation GDCrashReporterAppDelegate
@synthesize window;
@synthesize title;
@synthesize comments;
@synthesize ctext;
@synthesize icon;
@synthesize save;

- (void) applicationDidFinishLaunching:(NSNotification *) aNotification {
	[ctext setFont:[NSFont fontWithName:@"Courier" size:11]];
	[comments setFont:[NSFont fontWithName:@"Lucida Grande" size:11]];
	[ctext setTextContainerInset:NSMakeSize(0,4)];
	[comments setTextContainerInset:NSMakeSize(0,4)];
	workspace = [NSWorkspace sharedWorkspace];
	defaults = [NSUserDefaults standardUserDefaults];
	char * _crashedAppName = getenv("GDCrashReporterCrashedAppName");
	//if(!_crashedAppName) [[NSApplication sharedApplication] terminate:nil];
	char * _crashedAppBundleId = getenv("GDCrashReporterCrashedAppBundleId");
	char * _crashedAppBundlePath = getenv("GDCrashReporterCrashedAppBundlePath");
	char * _crashReporterWindowTitle = getenv("GDCrashReporterWindowTitle");
	char * _crashReporterTitle = getenv("GDCrashReporterTitle");
	if(_crashedAppName) crashedAppName = [[NSString stringWithUTF8String:_crashedAppName] retain];
	if(_crashedAppBundlePath) crashedAppBundlePath = [[NSString stringWithUTF8String:_crashedAppBundlePath] retain];
	if(_crashedAppBundleId) {
		crashedAppBundleId = [[NSString stringWithUTF8String:_crashedAppBundleId] retain];
		crashedAppDefaults = [[crashedAppBundleId stringByAppendingFormat:@"_%@",@"GDCrashReporter"] retain];
		crashReporterIgnore = [[crashedAppDefaults stringByAppendingFormat:@".%@",@"Ignore"] retain];
		NSImage * icn = [workspace iconForFile:crashedAppBundlePath];
		[icn setSize:NSMakeSize(51,51)];
		[icon setImage:icn];
	}
	if(_crashReporterWindowTitle) crashReporterWindowTitle = [[NSString stringWithUTF8String:_crashReporterWindowTitle] retain];
	if(_crashReporterTitle) crashReporterTitle = [[NSString stringWithUTF8String:_crashReporterTitle] retain];
	if(crashReporterWindowTitle) [window setTitle:crashReporterWindowTitle];
	if(crashReporterTitle) [title setStringValue:crashReporterTitle];
	if(crashedAppName) {
		//[comments insertText:@"HELLO!"];
		NSString * crashedFile = [GDCrashFinder getLatestCrashReportForApplication:crashedAppName];
		NSLog(@"!crash file: %@",crashedFile);
		content = [NSString stringWithContentsOfFile:crashedFile encoding:NSUTF8StringEncoding error:nil];
		[[[ctext textStorage] mutableString] appendString:content];
		[ctext setFont:[NSFont fontWithName:@"Courier" size:11]];
		//NSLog(@"content: %@",content);
		[ctext insertText:content];
	}
}

- (IBAction) onCancel:(id) sender {
	[[NSApplication sharedApplication] terminate:NULL];
}

- (IBAction) onSend:(id) sender {
	
}

- (IBAction) onPromptChange:(id) sender {
	NSButton * btn = (NSButton *)sender;
	if(crashReporterIgnore) {
		[defaults setBool:[btn state] forKey:crashReporterIgnore];
		[defaults synchronize];
	}
}

@end
