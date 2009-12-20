
#import <Cocoa/Cocoa.h>
#import "macros.h"

/**
 * @file GDApplicationInfo.h
 * 
 * Header file for GDApplicationInfo.
 */

/**
 * The GDApplicationInfo is a dictionary which can load the main bundle's
 * info plist, or any plist you specify.
 *
 * You can use this to extend, or write extensions to GDKit, and if any of
 * those extensions require some type of configiration, it can
 * be specified through this dictionary manually in code, or by loading in
 * a plist.
 *
 * @see GDModel
 */
@interface GDApplicationInfo : NSMutableDictionary {
	
}

/**
 * Returns an autoreleased instance, and has alread loaded the
 * main bundle's info dictionary.
 */
+ (GDApplicationInfo *) instanceFromDefaultPlist;

/**
 * Returns an autoreleased instance that was loaded from a plist.
 */
+ (GDApplicationInfo *) instanceFromLoadingPlist:(NSString *) _plist;

/**
 * Loads the main bundle's info dictionary and adds in those key/vals
 * to this dictionary.
 */
- (void) loadDefaultInfoPlist;

/**
 * Loads in a plist and merges it's key/vals into this dictionary.
 */
- (void) loadPlist:(NSString *) _plist;

@end
