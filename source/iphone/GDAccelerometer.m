
#import "GDAccelerometer.h"

static GDAccelerometer * inst;

@implementation GDAccelerometer
@synthesize enabled;
@synthesize shouldPrintAccelerometerData;

+ (GDAccelerometer *) sharedInstance {
	@synchronized(self) {
		if(!inst) {
			inst = [[self alloc] init];
		}
	}
	return inst;
}

- (id) init {
	if(!(self=[super init]))return nil;
	enabled=true;
	targets=[[NSMutableArray alloc] init];
	accelerometer=[UIAccelerometer sharedAccelerometer];
	[accelerometer setUpdateInterval:.05];
	[accelerometer setDelegate:self];
	return self;
}

- (void) setUpdateInterval:(NSTimeInterval) _interval {
	[accelerometer setUpdateInterval:_interval];
}

- (void) registerTarget:(id) _target forAcceleration:(SEL) _selector {
	GDCallback * target = [[GDCallback alloc] initWithTarget:_target andAction:_selector];
	[targets addObject:target];
	[target release];
}

- (void) unregisterTarget:(id) _target forAcceleration:(SEL) _selector {
	GDCallback * targ;
	NSUInteger i = 0;
	NSUInteger count = [targets count];
	NSMutableArray * removes = [NSMutableArray array];
	for(;i<count;i++) {
		targ=[targets objectAtIndex:i];
		if([targ target] == _target && [targ action] == _selector) [removes addObject:targ];
	}
	[targets removeObjectsInArray:removes];
}

- (void) unregisterSelectorForAllTargets:(SEL) _selector {
	GDCallback * targ;
	NSUInteger i = 0;
	NSUInteger count = [targets count];
	NSMutableArray * removes = [NSMutableArray array];
	for(;i<count;i++) {
		targ=[targets objectAtIndex:i];
		if([targ action] == _selector) [removes addObject:targ];
	}
	[targets removeObjectsInArray:removes];
}

- (void) accelerometer:(UIAccelerometer *) accelerometer didAccelerate:(UIAcceleration *) acceleration {
	if(!enabled)return;
	if(shouldPrintAccelerometerData)GDPrintUIAcceleration(acceleration);
	GDCallback * target;
	for(target in targets) {
		[[target target] performSelector:[target action] withObject:acceleration];
	}
}

- (void) dealloc {
	GDRelease(targets);
	[accelerometer setDelegate:nil];
	accelerometer=nil;
	enabled=false;
	[super dealloc];
}

+ (id) allocWithZone:(NSZone *) zone {
	@synchronized(self) {
		if(inst == nil) {
			inst = [super allocWithZone:zone];
			return inst;
		}
	}
	return nil;
}

- (id) copyWithZone:(NSZone *) zone {
	return self;
}

- (id) retain {
	return self;
}

- (NSUInteger) retainCount {
	return UINT_MAX;
}

- (id) autorelease {
	return self;
}

- (void) release {}

@end
