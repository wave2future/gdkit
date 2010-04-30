
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "macros.h"
#import "GDPrintUtils.h"
#import "GDCallback.h"

/**
 * @file GDAccelerometer.h
 *
 * Header file for GDAccelerometer.
 */

/**
 * @class GDAccelerometer
 *
 * The GDAccelerometer allows you to register many objects for callbacks
 * from the UIAccelerometer.
 */
@interface GDAccelerometer : NSObject <UIAccelerometerDelegate> {
	
	/**
	 * Whether or not this is enabled.
	 */
	BOOL enabled;
	
	/**
	 * Whether or not an NSLog should print each UIAcceleration that comes through.
	 */
	BOOL shouldPrintAccelerometerData;
	
	/**
	 * The accelerometer shared instance.
	 */
	UIAccelerometer * accelerometer;
	
	/**
	 * Registered targets.
	 */
	NSMutableArray * targets;
}

/**
 * Whether or not this is enabled.
 */
@property (nonatomic,assign) BOOL enabled;

/**
 * Whether or not an NSLog should print each UIAcceleration that comes through.
 */
@property (nonatomic,assign) BOOL shouldPrintAccelerometerData;

/**
 * Singleton access.
 */
+ (GDAccelerometer *) sharedInstance;

/**
 * Register a target and action callback, your selector should accept a UIAcceleration.
 */
- (void) registerTarget:(id) _target forAcceleration:(SEL) _selector;

/**
 * Unregister a target callback.
 */
- (void) unregisterTarget:(id) _target forAcceleration:(SEL) _selector;

/**
 * Unregisters a callback to any target for a selector.
 */
- (void) unregisterSelectorForAllTargets:(SEL) _selector;

/**
 * Sets the update interval for UIAcceleration.
 */
- (void) setUpdateInterval:(NSTimeInterval) _interval;

@end
