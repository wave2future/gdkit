
#import <Cocoa/Cocoa.h>
#import "GDBaseObject.h"

/**
 * @file GDCliProxy.h
 * 
 * Header file for GDCliProxy.
 */

/**
 * The GDCliProxy is a base commandline proxy object. You use distributed
 * objects to connect to this proxy, and have it execute something "in" your
 * application, from the outside (outside being a different commandline binary).
 */
@interface GDCliProxy : GDBaseObject {
	
	/**
	 * An NSConnection for distributed objects.
	 */
	NSConnection * connection;
}

/**
 * An NSConnection for distributed objects.
 */
@property (retain) NSConnection * connection;

/**
 * Connect the NSConnection using connection name.
 *
 * @param connectionName The connection name to use when the NSConnection connects.
 */
- (void) connectWithConnectionName:(NSString *) connectionName;

@end
