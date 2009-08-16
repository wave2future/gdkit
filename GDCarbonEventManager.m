//copyright 2009 aaronsmith

#import "GDCarbonEventManager.h"

static GDCarbonEventManager * inst = nil;

@class EventKeyWrapper;
@interface EventKeyWrapper : NSObject
{
	NSUInteger keyInArray;
}
- (id) initWithKey:(NSUInteger) key;
@end

@implementation GDCarbonEventManager

+ (GDCarbonEventManager *) sharedInstance
{
    @synchronized(self) {
		if(!inst) {
			[[self alloc] init];
		}
    }
    return inst;
}

+ (NSUInteger) carbonToCocoaModifierFlags:(NSUInteger) carbonFlags {
	NSUInteger cocoaFlags = 0;
	if(carbonFlags & cmdKey) cocoaFlags |= NSCommandKeyMask;
	if(carbonFlags & optionKey) cocoaFlags |= NSAlternateKeyMask;
	if(carbonFlags & controlKey) cocoaFlags |= NSControlKeyMask;
	if(carbonFlags & shiftKey) cocoaFlags |= NSShiftKeyMask;
	if(carbonFlags & NSFunctionKeyMask) cocoaFlags += NSFunctionKeyMask;
	return cocoaFlags;
}

+ (NSUInteger) cocoaToCarbonModifierFlags:(NSUInteger) cocoaFlags {
	NSUInteger carbonFlags = 0;
	if(cocoaFlags & NSCommandKeyMask) carbonFlags |= cmdKey;
	if(cocoaFlags & NSAlternateKeyMask) carbonFlags |= optionKey;
	if(cocoaFlags & NSControlKeyMask) carbonFlags |= controlKey;
	if(cocoaFlags & NSShiftKeyMask) carbonFlags |= shiftKey;
	if(cocoaFlags & NSFunctionKeyMask) carbonFlags |= NSFunctionKeyMask;
	return carbonFlags;
}

- (id) init {
	if(self = [super init]) {
		eventsLookup = [[NSMutableDictionary alloc] init];
		eventGroups = [[NSMutableDictionary alloc] init];
		eventInstallQueueDict = [[NSMutableDictionary alloc] init];
		eventInstallQueueArray = [[NSMutableArray alloc] init];
		eventInstallQueueForGroups = [[NSMutableDictionary alloc] init];
	}
	return self;
}

- (void) registerAndInstallQueuedEvents {
	GDCarbonEvent * e;
	for(e in [eventInstallQueueArray objectEnumerator]) {
		[self registerAndInstallGDCarbonEvent:e uninstallIfExists:TRUE];
	}
}

- (void) queueForInstall:(GDCarbonEvent *) event unique:(Boolean) unique {
	NSString * key = [NSString stringWithFormat:@"%d",([event keyCode]+[event modifierFlags])];
	if(!unique) {
		[eventInstallQueueArray addObject:event];
		return;
	}
	@synchronized(self) {
		NSUInteger index = (NSUInteger)[[eventInstallQueueDict valueForKey:key] key];
		if(index) [eventInstallQueueArray replaceObjectAtIndex:index withObject:event];
		else {
			NSUInteger last = [eventInstallQueueArray count];
			EventKeyWrapper * index = [[[EventKeyWrapper alloc] initWithKey:last] autorelease];
			[eventInstallQueueDict setObject:index forKey:key];
			[eventInstallQueueArray addObject:event];
		}
	}
}

- (void) registerAndInstallQueuedEventsForGroup:(NSString *) groupName {
	NSMutableArray * group = [eventInstallQueueForGroups valueForKey:groupName];
	GDCarbonEvent * e;
	for(e in [group objectEnumerator]) [self registerAndInstallGDCarbonEvent:e inGroup:groupName uninstallIfExists:TRUE];
}

- (void) queueForInstall:(GDCarbonEvent *) event intoGroup:(NSString *) groupName unique:(Boolean) unique {
	NSString * key = [NSString stringWithFormat:@"%d",([event keyCode]+[event modifierFlags])];
	NSMutableDictionary * group = [eventInstallQueueForGroupDict valueForKey:groupName];
	if(!group) {
		group = [[[NSMutableDictionary alloc] init] autorelease];
		[eventInstallQueueForGroupDict setObject:group forKey:groupName];
		NSMutableDictionary * arrayLookups = [[[NSMutableDictionary alloc] init] autorelease];
		[eventInstallQueueForGroups setObject:arrayLookups forKey:groupName];
	}
	NSMutableArray * queueArray = [eventInstallQueueForGroups valueForKey:groupName];
	if(!unique) {
		[queueArray addObject:event];
		return;
	}
	@synchronized(self) {
		NSUInteger index = (NSUInteger)[[group valueForKey:key] key];
		if(index) [queueArray replaceObjectAtIndex:index withObject:event];
		else {
			NSUInteger last = [queueArray count];
			EventKeyWrapper * index = [[[EventKeyWrapper alloc] initWithKey:last] autorelease];
			[group setObject:index forKey:key];
			[queueArray addObject:event];
		}
	}
	
}

- (void) flushQueuedInstall {
	[eventInstallQueueDict release];
	[eventInstallQueueArray release];
	eventInstallQueueDict = [[NSMutableDictionary alloc] init];
	eventInstallQueueArray = [[NSMutableArray alloc] init];
}

- (void) flushQueuedInstallForGroup:(NSString *) groupName {
	[eventInstallQueueForGroupDict removeObjectForKey:groupName];
	[eventInstallQueueForGroups removeObjectForKey:groupName];
}

- (void) flushAllQueuedGroupInstalls {
	[eventInstallQueueForGroupDict release];
	[eventInstallQueueForGroups release];
	eventInstallQueueForGroupDict = [[NSMutableDictionary alloc] init];
	eventInstallQueueForGroups = [[NSMutableDictionary alloc] init];
}

- (void) releaseGroup:(NSString *) groupName {
	[eventGroups removeObjectForKey:groupName];
}

- (void) uninstallAndReleaseGroup:(NSString *) groupName {
	NSMutableDictionary * group = [eventGroups valueForKey:groupName];
	GDCarbonEvent * e;
	for(e in [group objectEnumerator]) [e uninstall];
	[eventGroups removeObjectForKey:groupName];
}

- (void) registerAndInstallGDCarbonEvent:(GDCarbonEvent *) event inGroup:(NSString *) groupName uninstallIfExists:(Boolean) uninstall {
	NSMutableDictionary * group = [eventGroups valueForKey:groupName];
	NSString * key = [NSString stringWithFormat:@"%d",([event keyCode]+[event modifierFlags])];
	if(!group) {
		group = [[NSMutableDictionary alloc] init];
		[eventGroups setObject:group forKey:groupName];
	} else {
		GDCarbonEvent * e = [group valueForKey:key];
		[e uninstall];
		[group removeObjectForKey:key];
	}
	[group setObject:event forKey:key];
	[event install];
}

- (void) registerGDCarbonEvent:(GDCarbonEvent *) event inGroup:(NSString *) groupName uninstallIfExists:(Boolean) uninstall {
	NSMutableDictionary * group = [eventGroups valueForKey:groupName];
	if(!group) {
		group = [[NSMutableDictionary alloc] init];
		[eventGroups setObject:group forKey:groupName];
	}
	NSString * key = [NSString stringWithFormat:@"%d",([event keyCode]+[event modifierFlags])];
	[group setObject:event forKey:key];
}

- (void) registerAndInstallGDCarbonEvent:(GDCarbonEvent *) event uninstallIfExists:(Boolean) uninstall {
	[self registerGDCarbonEvent:event uninstallIfExists:uninstall];
	[event install];
}

- (void) registerGDCarbonEvent:(GDCarbonEvent *) event uninstallIfExists:(Boolean) uninstall {
	NSString * key = [NSString stringWithFormat:@"%d",([event keyCode]+[event modifierFlags])];
	GDCarbonEvent * ev = [eventsLookup valueForKey:key];
	if(uninstall) [ev uninstall];
	[eventsLookup setObject:event forKey:key];
	[event retain];
}

- (void) unregisterGDCarbonEvent:(GDCarbonEvent *) event shouldUninstall:(Boolean) uninstall {
	NSString * key = [NSString stringWithFormat:@"%d",([event keyCode]+[event modifierFlags])];
	if(uninstall) {
		GDCarbonEvent * e = [eventsLookup objectForKey:key];
		[e uninstall];
	}
	[eventsLookup removeObjectForKey:key];
}

- (void) uninstallAll {
	GDCarbonEvent * e;
	for(e in [eventsLookup objectEnumerator]) [e uninstall];
}

- (void) installAll {
	GDCarbonEvent * e;
	for(e in [eventsLookup objectEnumerator]) [e install];
}

- (void) releaseAll {
	[eventsLookup release];
	eventsLookup = [[NSMutableDictionary alloc] init];
}

- (void) uninstallAndReleaseAll {
	[self uninstallAll];
	[self releaseAll];
}

+ (id)allocWithZone:(NSZone *) zone {
    @synchronized(self) {
		if (inst == nil) {
			inst = [super allocWithZone:zone];
			return inst;
		}
	}
	return nil;
}

- (id)copyWithZone:(NSZone *) zone {
	return self;
}

- (id)retain {
	return self;
}

- (unsigned) retainCount {
	return UINT_MAX;
}

- (id) autorelease {
	return self;
}

- (void) release{
}

@end

//wrapper used to store key information
@implementation EventKeyWrapper
- (id) initWithKey:(NSUInteger) key {
	if(self = [super init]) {
		keyInArray = key;
	}
	return self;
}
- (NSUInteger) key {
	return keyInArray;
}
- (void) dealloc {
	keyInArray = 0;
	[super dealloc];
}
@end
