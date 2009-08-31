//copyright 2009 aaronsmith

#import "GDQuartzDisplay.h"

@implementation GDQuartzDisplay

+ (NSMutableArray *) activeDisplays {
	NSMutableArray * res = [NSMutableArray array];
	CGDirectDisplayID ids[kGDMaxDisplays];
	CGDisplayCount count;
	CGDisplayErr e = CGGetActiveDisplayList(kGDMaxDisplays,ids,&count);
	if(e > 0) {
		printf("Error activeDispays\n");
		return nil;
	}
	int i = 0;
	for(i;i < count; i++) {
		GDQuartzDisplay * dis = [[[GDQuartzDisplay alloc] initWithDirectDisplayID:(CGDirectDisplayID)ids[i]] autorelease];
		if(dis != nil) [res addObject:dis];
	}
	return res;
}

+ (NSMutableArray *) onlineDisplays {
	NSMutableArray * res = [NSMutableArray array];
	CGDirectDisplayID ids[kGDMaxDisplays];
	CGDisplayCount count;
	CGDisplayErr e = CGGetOnlineDisplayList(kGDMaxDisplays,ids,&count);
	if(e > 0) {
		printf("Error activeDispays\n");
		return nil;
	}
	int i = 0;
	for(i;i < count; i++) {
		GDQuartzDisplay * dis = [[[GDQuartzDisplay alloc] initWithDirectDisplayID:(CGDirectDisplayID)ids[i]] autorelease];
		if(dis != nil) [res addObject:dis];
	}
	return res;
}

+ (GDQuartzDisplay *) mainDisplay {
	return [[[GDQuartzDisplay alloc] initWithDirectDisplayID:CGMainDisplayID()] autorelease];
}

- (id) initWithPoint:(NSPoint) point {
	if(self = [super init]) {
		CGPoint tp;
		tp.x = point.x;
		tp.y = point.y;
		CGDirectDisplayID ids[kGDMaxDisplays];
		CGDisplayCount count;
		CGDisplayErr e = CGGetDisplaysWithPoint(tp,kGDMaxDisplays,ids,&count);
		if(e > 0) {
			printf("ERROR initWithPoint\n");
			return nil;
		}
		if(count == 1) {
			displayId = (CGDirectDisplayID) ids[0];
		} else { //find the display that's a primary in mirror set.
			printf("Have to handle multiple display ids\n");
			/**int i = 0;
			for(i; i < count;i++) {
			}*/
		}
	}
	return self;
}

- (id) initWithRect:(NSRect) rect {
	if(self = [super init]) {
		CGRect tr;
		tr.origin.x = rect.origin.x;
		tr.origin.y = rect.origin.y;
		tr.size.width = rect.size.width;
		tr.size.height = rect.size.height;
		CGDirectDisplayID ids[kGDMaxDisplays];
		CGDisplayCount count;
		CGDisplayErr e = CGGetDisplaysWithRect(tr,kGDMaxDisplays,ids,&count);
		if(e > 0) {
			printf("ERROR initWithPoint\n");
			return nil;
		}
		if(count == 1) {
			displayId = (CGDirectDisplayID) ids[0];
		} else { //find the display that's a primary in mirror set.
			printf("Have to handle multiple display ids\n");
			/**int i = 0;
			 for(i; i < count;i++) {
			 }*/
		}
	}
	return self;
}

- (id) initWithDirectDisplayID:(CGDirectDisplayID) ddid {
	if(self = [super init]) {
		displayId = ddid;
	}
	return self;
}

- (Boolean) isMainDisplay {
	return (Boolean) CGDisplayIsMain(displayId);
}

- (Boolean) isActive {
	return (Boolean) CGDisplayIsActive(displayId);
}

- (Boolean) isAlwaysInMirrorSet {
	return (Boolean) CGDisplayIsAlwaysInMirrorSet(displayId);
}

- (Boolean) isSleeping {
	return (Boolean) CGDisplayIsAsleep(displayId);
}

- (Boolean) isInMirrorSet {
	return (Boolean) CGDisplayIsInMirrorSet(displayId);
}

- (Boolean) isOnline {
	return (Boolean) CGDisplayIsOnline(displayId);
}

- (Boolean) isStereo {
	return (Boolean) CGDisplayIsStereo(displayId);
}

- (Boolean) isPrimaryDisplayInMirrorSet {
	return FALSE;
}

- (GDQuartzDisplay *) mirrorsDisplay {
	CGDirectDisplayID mirroredDisplayID = CGDisplayMirrorsDisplay(displayId);
	if(mirroredDisplayID == kCGNullDirectDisplay) return nil;
	return [[[GDQuartzDisplay alloc] initWithDirectDisplayID:mirroredDisplayID] autorelease];
}

- (GDQuartzDisplay *) primaryDisplay {
	CGDirectDisplayID primaryDisplayID = CGDisplayPrimaryDisplay(displayId);
	if(primaryDisplayID == kCGNullDirectDisplay) return nil;
	return [[[GDQuartzDisplay alloc] initWithDirectDisplayID:primaryDisplayID] autorelease];
}

- (double) rotation {
	return CGDisplayRotation(displayId);
}

- (NSSize) millimeterSize {
	CGSize s = CGDisplayScreenSize(displayId);
	return NSMakeSize(s.width,s.height);
}

- (NSSize) pixelSize {
	CGFloat w = (CGFloat)CGDisplayPixelsWide(displayId);
	CGFloat h = (CGFloat)CGDisplayPixelsHigh(displayId);
	return NSMakeSize(w,h);
}

- (Boolean) usesOpenGLAcceleration {
	return CGDisplayUsesOpenGLAcceleration(displayId);
}

- (void) dealloc {
	displayId = 0;
	[super dealloc];
}

@end
