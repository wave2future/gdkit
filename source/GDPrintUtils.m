
#import "GDPrintUtils.h"

#if TARGET_OS_EMBEDDED || TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
	#import <UIKit/UIKit.h>
	#import "UIColor+Additions.h"
#endif

#if TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

void GDPrintNSTask(NSTask * task) {
	if(![task arguments] || !task) return;
	NSString * owt = [[task launchPath] stringByAppendingString:@" "];
	id arg;
	for(arg in [task arguments]) {
		owt = [[owt stringByAppendingString:[arg description]] stringByAppendingString:@" "];
	}
	NSLog(@"%@",owt);
}

NSString * GDPrintGetPrintedNSRect(NSRect _rect) {
	return [NSString stringWithFormat:@"NSRect(x:%g, y:%g, w:%g, h:%g)",_rect.origin.x,_rect.origin.y,_rect.size.width,_rect.size.height];
}

NSString * GDPrintGetPrintedNSSize(NSSize _size) {
	return [NSString stringWithFormat:@"NSSize(w:%g, h:%g)",_size.width,_size.height];
}

NSString * GDPrintGetPrintedNSPoint(NSPoint _point) {
	return [NSString stringWithFormat:@"NSPoint(x:%g, y:%g)",_point.x,_point.y];
}

#endif

#if TARGET_OS_EMBEDDED || TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR

void GDPrintUIColor(UIColor * color) {
	if(![color canProvideRGBComponents]) NSLog(@"UIColor cannot provide RGB components.");
	switch([color colorSpaceModel]) {
		case kCGColorSpaceModelRGB:
			NSLog(@"UIColor(<%@> r:%0.3f, g:%0.3f, b:%0.3f, a:%0.3f)",[color colorSpaceString],[color red],[color green],[color blue],[color alpha]);
			break;
		case kCGColorSpaceModelMonochrome:
			NSLog(@"UIColor(<%@> w:%0.3f, a:%0.3f)",[color white],[color alpha]);
			break;
	}
}

#endif