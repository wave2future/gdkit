
#import "GDScale9ButtonCell.h"

static int defaultCornerWidth = 7;
static int defaultCornerHeight = 7;

@implementation GDScale9ButtonCell
@synthesize upImage;
@synthesize downImage;
@synthesize cornerSize;
@synthesize upImageName;
@synthesize downImageName;
@synthesize cornerSizeHeight;
@synthesize cornerSizeWidth;

- (id) initWithCoder:(NSCoder *) _coder {
	if(!(self=[super initWithCoder:_coder])) return nil;
	NSKeyedUnarchiver * unarchiver = (NSKeyedUnarchiver *)_coder;
	decoding = true;
	if([unarchiver containsValueForKey:@"GDScale9ButtonCell.upImageName"]) [self setUpImageName:[unarchiver decodeObjectForKey:@"GDScale9ButtonCell.upImageName"]];
	if([unarchiver containsValueForKey:@"GDScale9ButtonCell.downImageName"]) [self setDownImageName:[unarchiver decodeObjectForKey:@"GDScale9ButtonCell.downImageName"]];
	if([unarchiver containsValueForKey:@"GDScale9ButtonCell.cornerSize.width"]) cornerSize.width = [unarchiver decodeIntegerForKey:@"GDScale9ButtonCell.cornerSize.width"];
	if([unarchiver containsValueForKey:@"GDScale9ButtonCell.cornerSize.height"]) cornerSize.height = [unarchiver decodeIntegerForKey:@"GDScale9ButtonCell.cornerSize.height"];
	decoding = false;
	if(!upImage && upImageName) upImage = [[NSImage imageNamed:upImageName] retain];
	if(!downImage && downImageName) downImage = [[NSImage imageNamed:downImageName] retain];
	if(cornerSize.width < 1) cornerSize.width = defaultCornerWidth;
	if(cornerSize.height < 1) cornerSize.height = defaultCornerHeight;
	[self setBezelStyle:NSRegularSquareBezelStyle];
	if([self controlView]) [[self controlView] setNeedsDisplay:true];
	return self;
}

- (void) encodeWithCoder:(NSCoder *) _coder {
	[super encodeWithCoder:_coder];
	NSKeyedArchiver * archiver = (NSKeyedArchiver *)_coder;
	[archiver encodeObject:upImageName forKey:@"GDScale9ButtonCell.upImageName"];
	[archiver encodeObject:downImageName forKey:@"GDScale9ButtonCell.downImageName"];
	[archiver encodeInteger:cornerSize.width forKey:@"GDScale9ButtonCell.cornerSize.width"];
	[archiver encodeInteger:cornerSize.height forKey:@"GDScale9ButtonCell.cornerSize.height"];
}

- (float) cornerSizeWidth {
	return cornerSize.width;
}

- (void) setCornerSizeWidth:(float) _width {
	if(cornerSize.width != _width) {
		cornerSize.width = _width;
		reslice = true;
		if(!decoding) if([self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (float) cornerSizeHeight {
	return cornerSize.height;
}

- (void) setCornerSizeHeight:(float) _height {
	if(cornerSize.height != _height) {
		cornerSize.height = _height;
		reslice = true;
		if(!decoding) if([self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (void) setCornerSize:(NSSize) _size {
	if(cornerSize.width != _size.width || cornerSize.height != _size.height) {
		cornerSize = _size;
		if(cornerSize.width < 1) cornerSize.width = defaultCornerWidth;
		if(cornerSize.height < 1) cornerSize.height = defaultCornerHeight;
		reslice = true;
		if(!decoding && [self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (void) setUpImage:(NSImage *) _image {
	if(_image != upImage) {
		[upImage release];
		upImage = [_image retain];
		reslice = true;
		if(!decoding && [self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (void) setDownImage:(NSImage *) _image {
	if(_image != downImage) {
		[downImage release];
		downImage = [_image retain];
		reslice = true;
		if(!decoding && [self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (void) setUpImageName:(NSString *) _upImageName {
	if(![upImageName isEqual:_upImageName]) {
		[upImageName release];
		upImageName = [_upImageName retain];
		upImageNameChanged = true;
		reslice = true;
		if(!decoding && [self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (void) setDownImageName:(NSString *) _downImageName {
	if(![downImageName isEqual:_downImageName]) {
		[downImageName release];
		downImageName = [_downImageName retain];
		downImageNameChanged = true;
		reslice = true;
		if(!decoding && [self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (void) drawBezelWithFrame:(NSRect) frame inView:(NSView *) controlView {
	frame = NSInsetRect(frame,2,2);
	frame.size.height -= 2;
	if(!upImage && upImageName) upImage = [[NSImage imageNamed:upImageName] retain];
	if(!downImage && downImageName) downImage = [[NSImage imageNamed:downImageName] retain];
	if([self respondsToSelector:@selector(ibPopulateKeyPaths:)]) {
		Class IBDocument = NSClassFromString(@"IBDocument");
		if(IBDocument) {
			id document = [IBDocument performSelector:@selector(documentForObject:) withObject:self];
			if(upImageNameChanged) {
				upImageNameChanged = false;
				if(upImage) [upImage release];
				upImage = [[document performSelector:@selector(documentImageNamed:) withObject:[upImageName stringByDeletingPathExtension]] retain];
			}
			if(downImageNameChanged) {
				downImageNameChanged = false;
				if(downImage) [downImage release];
				downImage = [[document performSelector:@selector(documentImageNamed:) withObject:[downImageName stringByDeletingPathExtension]] retain];
			}
			NSBundle * bundle = [NSBundle bundleWithIdentifier:@"com.macendeavor.GDKitMacIBAdditions"];
			NSFileManager * fm = [NSFileManager defaultManager];
			NSString * path;
			if(!upImage) {
				path = [bundle pathForResource:@"scale_nine_button_icon" ofType:@"png"];
				if([fm fileExistsAtPath:path]) {
					if(upImage) [upImage release];
					upImage = [[NSImage alloc] initWithContentsOfFile:path];
				}
			}
			if(!downImage) {
				path = [bundle pathForResource:@"scale_nine_button_icon_down" ofType:@"png"];
				if([fm fileExistsAtPath:path]) {
					if(downImage) [downImage release];
					downImage = [[NSImage alloc] initWithContentsOfFile:path];
				}
			}
		}
	}
	if(!upImage && !downImage) {
		reslice = false;
		return;
	}
	if([self isHighlighted]) {
		if(reslice || !downSlices) {
			[downSlices release];
			downSlices = [sliceImageForDrawNine(downImage,cornerSize) retain];
		}
		sourceSlices=downSlices;
	}
	if(![self isHighlighted]) {
		if(reslice) {
			[upSlices release];
			upSlices = [sliceImageForDrawNine(upImage,cornerSize) retain];
		}
		sourceSlices=upSlices;
	}
	reslice = false;
	if(!sourceSlices) return;
	NSDrawNinePartImage(frame,[sourceSlices objectAtIndex:0],[sourceSlices objectAtIndex:1],[sourceSlices objectAtIndex:2],
						[sourceSlices objectAtIndex:3],[sourceSlices objectAtIndex:4],[sourceSlices objectAtIndex:5],
						[sourceSlices objectAtIndex:6],[sourceSlices objectAtIndex:7],[sourceSlices objectAtIndex:8],
						NSCompositeSourceOver,1.0,[controlView isFlipped]);
}

- (void) dealloc {
	[super dealloc];
}

@end

/*
NSLog(@"isHighlighted: %i", [self isHighlighted]);

NSLog(@"TEST: %@",GDPrintGetPrintedNSPoint([controlView convertPoint:[currentEvent locationInWindow] toView:nil]));

if(isLeftMouseDown) {
isMouseUp = false;
BOOL coordsAreScreen = ([currentEvent window]==nil);
NSPoint localPoint;
NSPoint windowPoint = [currentEvent locationInWindow];
if(coordsAreScreen) {
NSLog(@"coords are screen!!!!!!!!!!!!!!!");
windowPoint = [[[self controlView] window] convertScreenToBase:windowPoint];
NSLog(@"coords are screen, windowPoint: %@",GDPrintGetPrintedNSPoint(windowPoint));
}
if(windowPoint.x < 0 || windowPoint.y < 0) {
isLeftMouseDown = false;
isMouseUp = true;
} else {
NSLog(@"windowPoint: %@",GDPrintGetPrintedNSPoint(windowPoint));

localPoint = [[self controlView] convertPoint:windowPoint toView:nil];
NSLog(@"localPoint: %@",GDPrintGetPrintedNSPoint(localPoint));

localPoint = [[[[self controlView] window] contentView] convertPoint:windowPoint fromView:[self controlView]];
NSLog(@"localPoint2: %@",GDPrintGetPrintedNSPoint(localPoint));

localPoint = [[self controlView] convertPoint:windowPoint fromView:[self controlView]];
NSLog(@"localPoint3: %@",GDPrintGetPrintedNSPoint(localPoint));

NSLog(@"is in rect: %i",NSPointInRect(localPoint,frame));
NSLog(@"frame: %@",GDPrintGetPrintedNSRect(frame));
if(!NSPointInRect(localPoint,frame)) isLeftMouseDown = false;
}
}

if(isLeftMouseDown) {
NSLog(@"mouse down");
}
*/