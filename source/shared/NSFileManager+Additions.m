//copyright 2009 aaronsmith

#import "NSFileManager+Additions.h"

@implementation NSFileManager (GDAdditions)

- (NSString *) pathToFolderOfType:(const OSType) folderType shouldCreateFolder:(BOOL) create {
	FSRef ref;
	NSString * path = nil;
	if(FSFindFolder(kUserDomain,folderType,create,&ref) == noErr) {
		CFURLRef url = CFURLCreateFromFSRef(kCFAllocatorSystemDefault,&ref);
		path = (NSString *) CFURLCopyFileSystemPath(url, kCFURLPOSIXPathStyle);
		[path autorelease];
		CFRelease(url);
	}
	return path;
}

- (NSString *) applicationSupportFolder {
	return [self pathToFolderOfType:kApplicationSupportFolderType shouldCreateFolder:YES];
}

- (NSString *) thisApplicationsSupportFolder {
	NSString * appname = [[NSBundle mainBundle] bundleIdentifier];
	NSString * path = [[self applicationSupportFolder] stringByAppendingPathComponent:appname];
	if(![self fileExistsAtPath:path]) {
		#if MAC_OS_X_VERSION_MAX_ALLOWED < 1050
			if(![self createDirectoryAtPath:path attributes:nil]) path = nil;
		#else
			if(![self createDirectoryAtPath:path withIntermediateDirectories:TRUE attributes:nil error:nil]) path=nil;
		#endif
	}
	return path;
}

- (NSString *) thisApplicationsSupportFolderByAppName {
	NSString * appname = [[NSProcessInfo processInfo] processName];
	NSString * path = [[self applicationSupportFolder] stringByAppendingPathComponent:appname];
	if(![self fileExistsAtPath:path]) {
		#if MAC_OS_X_VERSION_MAX_ALLOWED < 1050
			if(![self createDirectoryAtPath:path attributes:nil]) path = nil;	
		#else
			if(![self createDirectoryAtPath:path withIntermediateDirectories:TRUE attributes:nil error:nil]) path=nil;
		#endif
	}
	return path;
}

@end
