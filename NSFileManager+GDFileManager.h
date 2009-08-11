/*
 *  NSFileManager+GDFileManager.h
 *  gdkit
 *
 *  Created by Aaron Smith on 8/9/09.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */

#import <Foundation/NSFileManager.h>

@interface NSFileManager (GDFileManager)
- (NSString *) pathToFolderOfType:(const OSType) folderType shouldCreateFolder:(BOOL) create;
- (NSString *) applicationSupportFolder;
- (NSString *) thisApplicationsSupportFolder;
- (NSString *) thisApplicationsSupportFolderByAppName;
@end