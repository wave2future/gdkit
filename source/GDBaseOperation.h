
#import <Cocoa/Cocoa.h>

/**
 * @file GDBaseOperation.h
 * 
 * Header file for GDBaseNSTaskOperation.
 */

/**
 * The GDBaseOperation is a base NSOperation that sets up some
 * common properties for children operations.
 */
@interface GDBaseOperation : NSOperation {
	
	/**
	 * Whether or not this operation is done.
	 */
	BOOL done;
	
	/**
	 * Whether or not this operation is canceled.
	 */
	BOOL canceled;
}

@end
