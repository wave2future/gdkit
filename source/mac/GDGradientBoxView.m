
#import "GDGradientBoxView.h"

@implementation GDGradientBoxView
@synthesize gradient;
@synthesize color1;
@synthesize color2;
@synthesize angle;

- (id) initWithCoder:(NSCoder *) _coder {
	if(!(self=[super initWithCoder:_coder])) return nil;
	NSKeyedUnarchiver * unarchiver = (NSKeyedUnarchiver *)_coder;
	decoding = true;
	hasUpdatedAngle = false;
	angle = 90;
	color1 = [[NSColor colorWithDeviceRed:.99 green:.57 blue:.57 alpha:1] retain];
	color2 = [[NSColor colorWithDeviceRed:.99 green:.85 blue:.85 alpha:1] retain];
	if([unarchiver containsValueForKey:@"GDGradientBoxView.color1"]) [self setColor1:[unarchiver decodeObjectForKey:@"GDGradientBoxView.color1"]];
	if([unarchiver containsValueForKey:@"GDGradientBoxView.color2"]) [self setColor2:[unarchiver decodeObjectForKey:@"GDGradientBoxView.color2"]];
	if([unarchiver containsValueForKey:@"GDGradientBoxView.hasUpdatedAngle"]) {
		Boolean hasu = [unarchiver decodeBoolForKey:@"GDGradientBoxView.hasUpdatedAngle"];
		if(hasu) [self setAngle:[unarchiver decodeIntForKey:@"GDGradientBoxView.angle"]];
	}
	gradient = [[NSGradient alloc] initWithColors:[NSArray arrayWithObjects:color1,color2,nil]];
	decoding = false;
	recreateGradient = true;
	[self setNeedsDisplay:true];
	return self;
}

- (void) encodeWithCoder:(NSCoder *) _coder {
	[super encodeWithCoder:_coder];
	NSKeyedArchiver * archiver = (NSKeyedArchiver *)_coder;
	if(color1) [archiver encodeObject:color1 forKey:@"GDGradientBoxView.color1"];
	if(color2) [archiver encodeObject:color2 forKey:@"GDGradientBoxView.color2"];
	if(hasUpdatedAngle) [archiver encodeInt:angle forKey:@"GDGradientBoxView.angle"];
}

- (void) setColor1:(NSColor *) _color {
	if(color1 != _color) {
		[color1 release];
		color1 = [_color copy];
		recreateGradient = true;
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (void) setColor2:(NSColor *) _color {
	if(color2 != _color) {
		[color2 release];
		color2 = [_color copy];
		recreateGradient = true;
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (void) setGradient:(NSGradient *) _gradient {
	if(gradient != _gradient) {
		[gradient release];
		gradient = [_gradient copy];
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (void) setAngle:(int) _angle {
	if(angle != _angle) {
		angle = _angle;
		hasUpdatedAngle = true;
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (void) drawRect:(NSRect) dirtyrect {
	[super drawRect:dirtyrect];
	if(recreateGradient) {
		recreateGradient = false;
		GDRelease(gradient);
		gradient = [[NSGradient alloc] initWithColors:[NSArray arrayWithObjects:color1,color2,nil]];
	}
	if(gradient)[gradient drawInRect:[self bounds] angle:angle];
}

- (void) dealloc {
	GDRelease(gradient);
	GDRelease(color1);
	GDRelease(color2);
	angle = 0;
	decoding = false;
	hasUpdatedAngle = false;
	recreateGradient = false;
	[super dealloc];
}

@end
