
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