//
//  GDCarbonEventManager.m
//  gdkit
//
//  Created by Aaron Smith on 8/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GDCarbonEventManager.h"

static GDCarbonEventManager * inst = nil;

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
	}
	return self;
}

- (void) registerAndInstallGDCarbonEvent:(GDCarbonEvent *) event uninstallIfExists:(Boolean) uninstall {
	[self registerGDCarbonEvent:event uninstallIfExists:uninstall];
	[event install];
}

- (void) registerGDCarbonEvent:(GDCarbonEvent *) event uninstallIfExists:(Boolean) uninstall {
	NSString * key = [NSString stringWithFormat:@"%d",([event keyCode]+[event modifierFlags])];
	printf("event key: %s\n",[key UTF8String]);
	if(uninstall && [eventsLookup valueForKey:key]) {
		printf("SHOULD UNINSTALL");
		[event uninstall];
	}
	[eventsLookup setObject:event forKey:key];
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

//the usual singleton code.
+ (id)allocWithZone:(NSZone *) zone
{
    @synchronized(self) {
		if (inst == nil) {
			inst = [super allocWithZone:zone];
			return inst;
		}
	}
	return nil;
}
- (id)copyWithZone:(NSZone *) zone
{
	return self;
}
- (id)retain
{
	return self;
}
- (unsigned) retainCount
{
	return UINT_MAX;
}
- (id) autorelease
{
	return self;
}
- (void) release{}

@end
