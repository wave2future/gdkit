//copyright 2009 aaronsmith

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
	NSMutableDictionary * eventGroups;
	NSMutableDictionary * eventInstallQueueDict;
	NSMutableArray * eventInstallQueueArray;
	NSMutableDictionary * eventInstallQueueForGroupDict;
	NSMutableDictionary * eventInstallQueueForGroups;
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

/**
 * Uninstalls all GDCarbonEvents, then releases the
 * internal dictionary used to manage them, the internal dict
 * is re-initialized as an empty dict.
 */
- (void) uninstallAndReleaseAll;

/**
 * Registers a GDCarbonEvent with the manager, which will belong
 * to a group or events. The event is installed as the last operation.
 * Optionally if the same event (by charKey and modifiers) exists
 * in the group already, it's uninstalled and removed. And the new
 * one replaces it.
 */
- (void) registerAndInstallGDCarbonEvent:(GDCarbonEvent *) event inGroup:(NSString *) groupName uninstallIfExists:(Boolean) uninstall;

/**
 * Registers a GDCarbonEvent with the manager, which will belong
 * to a group or events. Optionally if the same event (by charKey
 * and modifiers) exists in the group already, it's uninstalled and
 * removed. And the new one replaces it.
 */
- (void) registerGDCarbonEvent:(GDCarbonEvent *) event inGroup:(NSString *) groupName uninstallIfExists:(Boolean) uninstall;

/**
 * Releases a group.
 */
- (void) releaseGroup:(NSString *) groupName;

/**
 * Uninstalls all GDCarobEvents inside of a group,
 * then releases the dictionary used as a handle onto them.
 * If the manager is the only plae that contains the
 * reference to the GDCarbonEvent, then it will be released.
 */
- (void) uninstallAndReleaseGroup:(NSString *) groupName;

/**
 * Registers and installs all queued events. (this just calls
 * [self registerAndInstallGDCarbonEvent] for each event in 
 * the queue.
 */
- (void) registerAndInstallQueuedEvents;

/**
 * Adds a CGCarbonEvent into the queue to be installed. Optionally
 * tell the manager that the event has to be unique.
 */
- (void) queueForInstall:(GDCarbonEvent *) event unique:(Boolean) unique;

/**
 * Registers and installs all queued events in a group queue.
 */
- (void) registerAndInstallQueuedEventsForGroup:(NSString *) groupName;

/**
 * Registers queued events to be installed into a group.
 */
- (void) queueForInstall:(GDCarbonEvent *) event intoGroup:(NSString *) groupName unique:(Boolean) unique;

/**
 * Releases the memory used to store events for the queue, you can
 * flush it after you've installed the events.
 */
- (void) flushQueuedInstall;

/**
 * Flush a queued install for a particular group.
 */
- (void) flushQueuedInstallForGroup:(NSString *) groupName;

@end

