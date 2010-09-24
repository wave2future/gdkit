
#import "UIColor+Additions.h"

@implementation UIColor (Additions)

- (CGColorSpaceModel) colorSpaceModel {
	return CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor));
}

- (NSString *) colorSpaceString {
	switch([self colorSpaceModel]) {
		case kCGColorSpaceModelUnknown:
			return @"kCGColorSpaceModelUnknown";
		case kCGColorSpaceModelMonochrome:
			return @"kCGColorSpaceModelMonochrome";
		case kCGColorSpaceModelRGB:
			return @"kCGColorSpaceModelRGB";
		case kCGColorSpaceModelCMYK:
			return @"kCGColorSpaceModelCMYK";
		case kCGColorSpaceModelLab:
			return @"kCGColorSpaceModelLab";
		case kCGColorSpaceModelDeviceN:
			return @"kCGColorSpaceModelDeviceN";
		case kCGColorSpaceModelIndexed:
			return @"kCGColorSpaceModelIndexed";
		case kCGColorSpaceModelPattern:
			return @"kCGColorSpaceModelPattern";
		default:
			return @"Not a valid color space";
	}
}

- (BOOL) canProvideRGBComponents {
	switch(self.colorSpaceModel) {
		case kCGColorSpaceModelRGB:
		case kCGColorSpaceModelMonochrome:
			return YES;
		default:
			return NO;
	}
}

- (CGFloat) red {
	NSAssert(self.canProvideRGBComponents, @"Must be a RGB color to use -red, -green, -blue");
	const CGFloat * c = CGColorGetComponents(self.CGColor);
	return c[0];
}

- (CGFloat) green {
	NSAssert(self.canProvideRGBComponents, @"Must be a RGB color to use -red, -green, -blue");
	const CGFloat * c = CGColorGetComponents(self.CGColor);
	if([self colorSpaceModel] == kCGColorSpaceModelMonochrome) return c[0];  
	return c[1];
}  

- (CGFloat) blue {
	NSAssert(self.canProvideRGBComponents, @"Must be a RGB color to use -red, -green, -blue");
	const CGFloat * c = CGColorGetComponents(self.CGColor);
	if([self colorSpaceModel] == kCGColorSpaceModelMonochrome) return c[0];
	return c[2];
}

- (CGFloat)white {
	NSAssert(self.colorSpaceModel == kCGColorSpaceModelMonochrome, @"Must be a Monochrome color to use -white");
	const CGFloat * c = CGColorGetComponents(self.CGColor);
	return c[0];
}

- (CGFloat) alpha {
	const CGFloat *c = CGColorGetComponents(self.CGColor);
	return c[CGColorGetNumberOfComponents(self.CGColor)-1];
}

@end
