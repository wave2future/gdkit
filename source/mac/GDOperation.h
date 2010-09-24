
#import <Foundation/Foundation.h>
#import <AvailabilityMacros.h>
#import "macros.h"
#import "GDCallback.h"

/**
 * @file GDOperation.h
 * 
 * Header file for GDBaseNSTaskOperation.
 */

#if TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
	#if MAC_OS_X_VERSION_MAX_ALLOWED > MAC_OS_X_VERSION_10_4
		#if MAC_OS_X_VERSION_MAX_ALLOWED < 1060
			#warning NSOperation behaves differently on 10.5 vs 10.6 - be sure to read the documentation.
		#endif
	#endif
#endif

/**
 * The GDOperation is an NSOperation that sets up some
 * common properties.
 *
 * <b>WARNING</b>
 * NSOperation and NSOperationQueue behave differently between 10.5 and 10.6.
 * If you're creating concurency with those classes in an app that will run on
 * both 10.5 and 10.6, you definitely need to thoroughly test your code.
 */
@interface GDOperation : NSOperation {
	
	/**
	 * Whether or not this operation is done.
	 */
	BOOL done;
	
	/**
	 * Whether or not this operation is canceled.
	 */
	BOOL canceled;
	
	/**
	 * An optional callback object you can use at any time.
	 */
	GDCallback * callback;
}

@property (retain,nonatomic) GDCallback * callback;

@end
