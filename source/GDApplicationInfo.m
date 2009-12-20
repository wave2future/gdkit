
#import "GDApplicationInfo.h"

static GDApplicationInfo * defaultInstance;

@implementation GDApplicationInfo

+ (GDApplicationInfo *) instanceFromDefaultPlist {
	GDApplicationInfo * info = [[GDApplicationInfo alloc] init];
	[info loadDefaultInfoPlist];
	return [info autorelease];
}

+ (GDApplicationInfo *) instanceFromLoadingPlist:(NSString *) _plist {
	GDApplicationInfo * info = [[GDApplicationInfo alloc] init];
	[info loadPlist:_plist];
	return [info autorelease];
}

+ (void) setDefaultInstance:(GDApplicationInfo *) instance {
	GDRelease(defaultInstance);
	defaultInstance=instance;
}

- (NSString *) description {
	return @"GDApplicationInfo";
}

- (void) loadDefaultInfoPlist {
	//[self addEntriesFromDictionary:[[NSBundle mainBundle] infoDictionary]];
}

- (void) loadPlist:(NSString *) _plist {
	//NSDictionary * dict=[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:_plist ofType:@"plist"]];
	//[self addEntriesFromDictionary:dict];
}

@end
