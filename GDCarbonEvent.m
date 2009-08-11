//
//  CarbonEvent.m
//  gdkit
//
//  Created by Aaron Smith on 8/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GDCarbonEvent.h"

static OSStatus hotKeyHandler(EventHandlerCallRef nextHandler, EventRef anEvent, void * userData) {
	
	EventHotKeyID hkRef;
	GetEventParameter(anEvent,kEventParamDirectObject,typeEventHotKeyID,NULL,sizeof(hkRef),NULL,&hkRef);
	printf("hotKeyId: %i\n",hkRef.id);
	
	GDCarbonEvent * e = (GDCarbonEvent *) userData;
	printf("ID: %s\n",[[e testID] UTF8String]);
	
	NSString * t = [NSString stringWithCString:(const char *)hkRef.signature];
	printf("SIG: %s\n",[t UTF8String]);
	
	[e call];
	return noErr;
}

//static int look[24];
static NSMutableDictionary * gdceLookup = nil;
static unsigned int eventIds = 0;

@implementation GDCarbonEvent

@synthesize userInfo;
@synthesize notificationName;
@synthesize notificationCenter;
@synthesize target;
@synthesize action;
@synthesize keyCode;
@synthesize modifierFlags;

+ (GDCarbonEvent *) createKeyEvent:(int) key modifierFlags:(int) flags whichCallsAction:(SEL) action onTarget:(id) target withUserInfo:(NSDictionary *) userInfo {
	GDCarbonEvent * ev = [[self alloc] init];
	[ev setAction:action];
	[ev setTestID:@"ONE"];
	[ev setTarget:target];
	[ev setKeyCode:key];
	[ev setModifierFlags:flags];
	[ev setUserInfo:userInfo];
	[ev setEventClass:kEventClassKeyboard];
	[ev setEventKind:kEventHotKeyPressed];
	@synchronized(ev) {
		eventIds+=1;
	}
	[ev setHotKeyId:eventIds];
	NSString * sig = [NSString stringWithFormat:@"htk%i",eventIds];
	[ev setHotKeySignature:sig];
	[ev install];
	return ev;
}

+ (GDCarbonEvent *) createKeyEvent:(int) key modifierFlags:(int) flags whichPostsNotification:(NSString *) notificationName toCenter:(NSNotificationCenter *) center withUserInfo:(NSDictionary *) userInfo {
	GDCarbonEvent * ev = [[self alloc] init];
	[ev setNotificationCenter:center];
	[ev setTestID:@"TWO"];
	[ev setNotificationName:notificationName];
	[ev setKeyCode:key];
	[ev setModifierFlags:flags];
	[ev setUserInfo:userInfo];
	[ev setEventClass:kEventClassKeyboard];
	[ev setEventKind:kEventHotKeyPressed];
	@synchronized(ev) {
		eventIds+=1;
	}
	[ev setHotKeyId:eventIds];
	NSString * sig = [NSString stringWithFormat:@"htk%i",eventIds];
	[ev setHotKeySignature:sig];
	[ev install];
	return ev;
}

- (id) init {
	self = [super init];
	if(!gdceLookup) gdceLookup = [[NSMutableDictionary alloc] init];
	return self;
}

- (NSString *) testID {
	return testID;
}

- (void) setTestID:(NSString *)s {
	testID = [s copy];
}

- (void) setHotKeySignature:(NSString *) signature {
	sigString = [signature retain];
	hotKeyId.signature = (OSType)[signature UTF8String];
}

- (int) hotKeyId {
	return hotKeyId.id;
}

- (void) setHotKeyId:(int) kid {
	hotKeyId.id = kid;
}

- (void) setEventClass:(FourCharCode) eventClass {
	eventSpec.eventClass = (OSType) eventClass;
}

- (void) setEventKind:(unsigned int) eventKind {
	eventSpec.eventKind = eventKind;
}

- (void) install {
	InstallApplicationEventHandler(&hotKeyHandler,1,&eventSpec,self,NULL);
	RegisterEventHotKey(keyCode,modifierFlags,hotKeyId,GetApplicationEventTarget(),0,&hotKeyRef);
}

- (void) uninstall {
}

- (void) call {
	printf("--CALL--\n");
	printf("ID:%s\n",[testID UTF8String]);
	printf("kid:%i\n",hotKeyId.id);
	if(notificationName != nil) {
		[notificationCenter postNotificationName:notificationName object:self userInfo:userInfo];
	} else if(target && action) {
		[target performSelector:action withObject:userInfo];
	}
}

- (void) dealloc {
	[self uninstall];
	[sigString release];
	[self setNotificationName:NULL];
	[self setKeyCode:0];
	[self setModifierFlags:0];
	[super dealloc];
}

@end
