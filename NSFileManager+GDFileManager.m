//
//  NSFileManager+GDFileManager.m
//  gdkit
//
//  Created by Aaron Smith on 8/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

@implementation NSFileManager (GDFileManager)

- (NSString *) pathToFolderOfType:(const OSType) folderType shouldCreateFolder:(BOOL) create
{
	OSErr err;
	FSRef ref;
	NSString * path = nil;
	err = FSFindFolder(kUserDomain,folderType,create,&ref);
	if(err == noErr)
	{
		//convert to CFURL and thence to path
		CFURLRef url = CFURLCreateFromFSRef(kCFAllocatorSystemDefault,&ref);
		path = (NSString *) CFURLCopyFileSystemPath(url, kCFURLPOSIXPathStyle);
		CFRelease(url);
	}
	return [path autorelease];
}

// returns the path to the general app support folder for the current user
- (NSString *) applicationSupportFolder
{
	return [self pathToFolderOfType:kApplicationSupportFolderType shouldCreateFolder:YES];
}

// returns a path to a folder within the applicaiton support folder having the same name as the app
// itself. This is a good place to place support files.
- (NSString *) thisApplicationsSupportFolder
{
	NSString * appname = [[NSBundle mainBundle] bundleIdentifier];
	NSString * path = [[self applicationSupportFolder] stringByAppendingPathComponent:appname];
	if (![self fileExistsAtPath:path])
	{
		if(![self createDirectoryAtPath:path attributes:nil]) path = nil;
		//if( !result )
		//	[NSException raise:NSGenericException format:@"The folder '%@' could not be created", path ];
	}
	return path;
}

- (NSString *) thisApplicationsSupportFolderByAppName {
	NSString * appname = [[NSProcessInfo processInfo] processName];
	NSString * path = [[self applicationSupportFolder] stringByAppendingPathComponent:appname];
	if (![self fileExistsAtPath:path])
	{
		if(![self createDirectoryAtPath:path attributes:nil]) path = nil;
		//if( !result )
		//	[NSException raise:NSGenericException format:@"The folder '%@' could not be created", path ];
	}
	return path;
}

@end
