//
//  GDCarbonEventManager.h
//  gdkit
//
//  Created by Aaron Smith on 8/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GDCarbonEvent.h"

/**
 * The GDCarbonEventManager manages multiple
 * GDCarbonEvents. Really the only time you
 * need to use this is when you have multiple
 * GDCarbonEvents that could potentially be
 * listening for the same keys - in this case
 * use the manager to register, and unregister
 * GDCarbonEvents, which will automatically
 * install/uninstall when needed.
 */
@interface GDCarbonEventManager : NSObject {
	NSMutableDictionary * eventsLookup;
}

/**
 * Singleton instance.
 */
+ (GDCarbonEventManager *) sharedInstance;

/**
 * Class method to convert carbon to cocoa
 * key modifiers.
 */
+ (NSUInteger) carbonToCocoaModifierFlags:(NSUInteger) carbonFlags;

/**
 * Class method to convert cocoa to carbon
 * key modifiers.
 */
+ (NSUInteger) cocoaToCarbonModifierFlags:(NSUInteger) cocoaFlags;

/**
 * Registers a GDCarbonEvent, and installs the event
 * with the carbon event manager.
 */
- (void) registerAndInstallGDCarbonEvent:(GDCarbonEvent *) event uninstallIfExists:(Boolean) uninstall;

/**
 * Register a GDCarbonEvent
 */
- (void) registerGDCarbonEvent:(GDCarbonEvent *) event uninstallIfExists:(Boolean) uninstall;

/**
 * Unregister a GDCarbonEvent, optionall have the event
 * uninstall itself with the carbon event manager.
 */
- (void) unregisterGDCarbonEvent:(GDCarbonEvent *) event shouldUninstall:(Boolean) uninstall;

/**
 * Uninstalls all key handlers, but does not dispose
 * of any.
 */
- (void) uninstallAll;

/**
 * Reinstalls key handlers, that were disable.
 */
- (void) installAll;

/**
 * Releases all GDCarbonEvents registered - this does
 * not guarantee that a GDCarbonEvent is disposed of,
 * if you have a reference count to it from somewhere else
 * it won't be completely disposed.
 */
- (void) releaseAll;

- (void) uninstallAndReleaseAll;

@end

