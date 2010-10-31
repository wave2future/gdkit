
/*
 Description:
 
 This is a replacement for your applications' main.m file. It
 reacts to a crash and launches any executable you want. A
 default crash reporter is provided, but you can write your own.
 
 The behavior of this file is completely ignored if you're
 running the debugger.
 
 Usage:
 
 First you need to replace your own main.m file with this file.
 
 Then you need to define these keys in your applications' Info.plist.
 
 GDCrashReporterWindowTitle
 GDCrashReporterCrashedAppBundleId
 GDCrashReporterEmailPassword - this should be compiled in the c file
 GDCrashReporterSubmitURL
 
 * [GDCrashReporterAppName] - The application name that your launching
 after a crash. This should be the name only. If you're using
 the provided GDCrashReporter application it should be set to
 "GDCrashReporter".
 
 * [GDCrashReporterBundleId] - The crash applications' bundle id that
 your launching after a crash. If you're using the provided
 GDCrashReporter application it should be set to:
 "com.gngrwzrd.GDCrashReporter".
 
 * [GDCrashReporterRelativeBundlePath] - The relative path (from your
 applications bundle) to the ".app" bundle for the crash application.
 If you're using the provided GDCrashReporter application follow these
 rules:
 
 If your applications name is MyApp, It needs to be set relative to
 the top level director of MyApp.app. If you bundle the GDCrashReporter
 app in Resources. It would be defined like this:
 
 Contents/Resources/GDCrashReporter.app
 
 * [GDCrashReporterAbsoluteBundlePath] (Optional) - This is optional and
 overrides the GDCrashReporterRelativeBundlePath key. It's the absolute
 path to the ".app" bundle of the crash reporter. For example:
 
 /Applications/MyApp.app/Contents/Resources/GDCrashReporter.app
 
 You should only use the absolute path key when you're testing and know
 the absolute path. Chances are it won't be the same on someone else's
 computer. ONLY USE DURING DEVELOPMENT!
 
 * [GDCrashReporterRelativePath] - The relative path (from your applications
 bundle) to the unix executable for the crash application. If you're
 using the provided GDCrashReporter application follow these rules:
 
 If your applications name is MyApp, It needs to be set relative to
 the top level director of MyApp.app. If you bundle the GDCrashReporter
 app in Resources. It would be defined like this:
 
 Contents/Resources/GDCrashReporter.app/Contents/MacOS/GDCrashReporter
 
 * [GDCrashReporterAbsolutePath] (Optional) - This is optional and overrides
 the GDCrashReporterRelativePath key. It's the absolute path to the unix
 executable of the crash reporter. For example:
 
 /Applications/MyApp.app/Contents/Resources/GDCrashReporter.app/ \
 Contents/MacOS/GDCrashReporter
 
 You should only use the absolute path key when you're testing and know
 the absolute path. Chances are it won't be the same on someone else's
 computer. ONLY USE DURING DEVELOPMENT!
 
 EXAMPLE:
 
 Here's an example plist; only shows the keys we're interested in.
 
 <dict>
	<key>GDCrashReporterAppName</key>
	<string>GDCrashReporter</string>
	<key>GDCrashReporterBundleId</key>
	<string>com.gngrwzrd.GDCrashReporter</string>
	<key>GDCrashReporterRelativeBundlePath</key>
	<string>Contents/Resources/GDCrashReporter.app</string>
	<key>GDCrashReporterAbsoluteBundlePath</key>
	<string>/Applications/MyApp.app/Contents/Resources/GDCrashReporter.app</string>
	<key>GDCrashReporterRelativePath</key>
	<string>Contents/Resources/GDCrashReporter.app/Contents/MacOS/GDCrashReporter</string>
	<key>GDCrashReporterAbsolutePath</key>
	<string>/Applications/MyApp.app/Contents/Resources/GDCrashReporter.app/Contents/MacOS/GDCrashReporter</string>
 </dict>
 */

#include <assert.h>
#include <stdbool.h>
#include <string.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/sysctl.h>
#include <AvailabilityMacros.h>
#include <Availability.h>
#import <Cocoa/Cocoa.h>

//if debugger is running, don't fork a new child.
//developer.apple.com/library/mac/#qa/qa2004/qa1361.html
static bool debugging() {
	int junk;
	int mib[4];
	struct kinfo_proc info;
	size_t size;
	//unitialize the flags so that, if sysctl fails for some bizarre
	//reason, we get a predictable result.
	info.kp_proc.p_flag = 0;
	//initialize mib, which tells sysctl the info we want, in this case
	//we're looking for information about a specific process ID.
	mib[0] = CTL_KERN;
	mib[1] = KERN_PROC;
	mib[2] = KERN_PROC_PID;
	mib[3] = getpid();
	//call sysctl.
	size = sizeof(info);
	junk = sysctl(mib, sizeof(mib) / sizeof(*mib), &info, &size, NULL, 0);
	assert(junk == 0);
	//we're being debugged if the P_TRACED flag is set.
	return ((info.kp_proc.p_flag & P_TRACED)!=0);
}

#if TARGET_OS_MAC > MAC_OS_X_VERSION_10_5
//uses snow leopard NSRunningApplication api.
void bringApplicationToFrontByPID(pid_t pid) {
	NSRunningApplication * app = [NSRunningApplication runningApplicationWithProcessIdentifier:pid];
	[app activateWithOptions:NSApplicationActivateAllWindows];
}
#endif


//uses old trick with NSWorkspace.
void bringApplicationToFrontByBundlePath(NSString * bundlePath) {
	NSWorkspace * workspace = [NSWorkspace sharedWorkspace];
	[workspace launchApplication:bundlePath];
}

int main(int argc, char ** argv) {
	if(debugging()) return NSApplicationMain(argc,(const char **)argv);
	char * gdc = getenv("GDCrashReporter");
	//if gdc is set this process is the child.
	if(gdc) return NSApplicationMain(argc,(const char **)argv);
	setenv("GDCrashReporter","1",1);
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	NSBundle * bundle = [NSBundle mainBundle];
	NSDictionary * info = [bundle infoDictionary];
	NSString * MainApplicationName = [info objectForKey:@"CFBundleName"];
	NSString * MainApplicationPath = [bundle bundlePath];
	NSString * MainExecutablePath = [bundle executablePath];
	NSString * GDCrashReporterAppName = [info objectForKey:@"GDCrashReporterAppName"];
	NSString * GDCrashReporterBundleId = [info objectForKey:@"GDCrashReporterBundleId"];
	NSString * GDCrashReporterRelativeBundlePath = [info objectForKey:@"GDCrashReporterRelativeBundlePath"];
	NSString * GDCrashReporterAbsoluteBundlePath = [info objectForKey:@"GDCrashReporterAbsoluteBundlePath"];
	NSString * GDCrashReporterRelativePath = [info objectForKey:@"GDCrashReporterRelativePath"];
	NSString * GDCrashReporterAbsolutePath = [info objectForKey:@"GDCrashReporterAbsolutePath"];
	NSString * GDCrashReporterExecutableAppPath;
	NSString * GDCrashReporterBundlePath;
	if(GDCrashReporterAbsolutePath) GDCrashReporterExecutableAppPath = GDCrashReporterAbsolutePath;
	else GDCrashReporterExecutableAppPath = [MainApplicationPath stringByAppendingPathComponent:GDCrashReporterRelativePath];
	if(GDCrashReporterAbsoluteBundlePath) GDCrashReporterBundlePath = GDCrashReporterAbsoluteBundlePath;
	else GDCrashReporterBundlePath = [MainApplicationPath stringByAppendingPathComponent:GDCrashReporterRelativeBundlePath];
	//whether or not I've got enough info to launch the crash reporter
	bool canLaunchCrashReporter = (GDCrashReporterAppName != NULL && GDCrashReporterBundleId != NULL &&
								  (GDCrashReporterRelativePath != NULL || GDCrashReporterAbsolutePath != NULL) &&
								  (GDCrashReporterRelativeBundlePath != NULL || GDCrashReporterAbsoluteBundlePath != NULL));
	char ** ex1Params = malloc(sizeof(char *) * 2); //start first executable info
	char * ex1 = strdup((char *)[MainExecutablePath UTF8String]);
	char * ex1n = strdup((char*)[MainApplicationName UTF8String]);
	ex1Params[0] = ex1n;
	ex1Params[1] = NULL;
	pid_t child = fork();
	if(child==0) execvp(ex1,ex1Params); //launch myself with env set.
	sleep(.5); //short delay before requesting the app be brought to the front.
	bringApplicationToFrontByBundlePath(MainApplicationPath);
	#if TARGET_OS_MAC > MAC_OS_X_VERSION_10_5
	bringApplicationToFrontByPID(child);
	#endif
	int waited,status; //start second executable info
	while((waited=(wait(&status)))) {
		if(waited == -1 && errno == EINTR) continue;
		if(waited != -1 && waited != child) continue;
		break;
	}
	if(!WIFSIGNALED(status) || !canLaunchCrashReporter) {
		[pool release];
		free(ex1);
		free(ex1n);
		free(ex1Params);
		return WEXITSTATUS(status);
	}
	char ** ex2Params = malloc(sizeof(char *) * 2); //start crash executable info
	char * ex2 = strdup((char*)[GDCrashReporterExecutableAppPath UTF8String]);
	char * ex2n = strdup((char *)[GDCrashReporterAppName UTF8String]);
	ex2Params[0] = ex2n;
	ex2Params[1] = NULL;
	child = fork();
	if(child == 0) {
		setsid();
		execvp(ex2,ex2Params);
	}
	sleep(1); //short delay before requesting the app be brought to the front.
	bringApplicationToFrontByBundlePath(GDCrashReporterBundlePath);
	#if TARGET_OS_MAC > MAC_OS_X_VERSION_10_5
	bringApplicationToFrontByPID(child);
	#endif
	free(ex1);
	free(ex1n);
	free(ex1Params);
	free(ex2);
	free(ex2n);
	free(ex2Params);
	[pool release];
	return 0;
}
