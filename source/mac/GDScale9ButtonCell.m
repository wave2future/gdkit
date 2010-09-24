
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

+ (void) setDefaultCornerWidth:(int) width {
	defaultCornerWidth = width;
}

+ (void) setDefaultCornerHeight:(int) height {
	defaultCornerHeight = height;
}

+ (int) defaultCornerWidth {
	return defaultCornerWidth;
}

+ (int) defaultCornerHeight {
	return defaultCornerHeight;
}

- (id) copyWithZone:(NSZone *) zone {
	GDScale9ButtonCell * copy;
	copy = (GDScale9ButtonCell*)[super copyWithZone:zone];
	copy->upImage = nil;
	copy->downImage = nil;
	copy->upSlices = nil;
	copy->downSlices = nil;
	copy->lastUpSlicedImage = nil;
	copy->lastDownSlicedImage = nil;
	copy->upImageName = nil;
	copy->downImageName = nil;
	copy->reslice = false;
	copy->resliceDown = false;
	copy->resliceUp = false;
	copy->decoding = false;
	copy->upImageNameChanged = false;
	copy->downImageNameChanged = false;
	[copy setUpImage:upImage];
	[copy setDownImage:downImage];
	[copy setUpImageName:upImageName];
	[copy setDownImageName:downImageName];
	return copy;
}

- (id) init {
	if(!(self=[super init])) return nil;
	isInInterfaceBuilder = [self respondsToSelector:@selector(ibPopulateKeyPaths:)];
	IBDocument = NSClassFromString(@"IBDocument");
	document = [IBDocument performSelector:@selector(documentForObject:) withObject:self];
	gdKitIBBundle = [[NSBundle bundleWithIdentifier:@"com.macendeavor.GDKitMacIBAdditions"] retain];
	fileManager = [NSFileManager defaultManager];
	if(cornerSize.width < 1) cornerSize.width = defaultCornerWidth;
	if(cornerSize.height < 1) cornerSize.height = defaultCornerHeight;
	[self setBezelStyle:NSRegularSquareBezelStyle];
	return self;
}

- (id) initWithCoder:(NSCoder *) _coder {
	if(!(self=[super initWithCoder:_coder])) return nil;
	NSKeyedUnarchiver * unarchiver = (NSKeyedUnarchiver *)_coder;
	isInInterfaceBuilder = [self respondsToSelector:@selector(ibPopulateKeyPaths:)];
	IBDocument = NSClassFromString(@"IBDocument");
	document = [IBDocument performSelector:@selector(documentForObject:) withObject:self];
	gdKitIBBundle = [[NSBundle bundleWithIdentifier:@"com.macendeavor.GDKitMacIBAdditions"] retain];
	fileManager = [NSFileManager defaultManager];
	decoding = true;
	if([unarchiver containsValueForKey:@"GDScale9ButtonCell.upImageName"]) [self setUpImageName:[unarchiver decodeObjectForKey:@"GDScale9ButtonCell.upImageName"]];
	if([unarchiver containsValueForKey:@"GDScale9ButtonCell.downImageName"]) [self setDownImageName:[unarchiver decodeObjectForKey:@"GDScale9ButtonCell.downImageName"]];
	if([unarchiver containsValueForKey:@"GDScale9ButtonCell.cornerSize.width"]) cornerSize.width = [unarchiver decodeIntegerForKey:@"GDScale9ButtonCell.cornerSize.width"];
	if([unarchiver containsValueForKey:@"GDScale9ButtonCell.cornerSize.height"]) cornerSize.height = [unarchiver decodeIntegerForKey:@"GDScale9ButtonCell.cornerSize.height"];
	if(!upImage && upImageName) [self setUpImage:[NSImage imageNamed:upImageName]];
	if(!downImage && downImageName) [self setDownImage:[NSImage imageNamed:downImageName]];
	if(cornerSize.width < 1) cornerSize.width = defaultCornerWidth;
	if(cornerSize.height < 1) cornerSize.height = defaultCornerHeight;
	[self setBezelStyle:NSRegularSquareBezelStyle];
	decoding = false;
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
		resliceUp = true;
		if(!decoding && [self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (void) setDownImage:(NSImage *) _image {
	if(_image != downImage) {
		[downImage release];
		downImage = [_image retain];
		resliceDown = true;
		if(!decoding && [self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (void) setUpImageName:(NSString *) _upImageName {
	if(![upImageName isEqual:_upImageName]) {
		[upImageName release];
		upImageName = [_upImageName retain];
		upImageNameChanged = true;
		resliceUp = true;
		if(!decoding && [self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (void) setDownImageName:(NSString *) _downImageName {
	if(![downImageName isEqual:_downImageName]) {
		[downImageName release];
		downImageName = [_downImageName retain];
		downImageNameChanged = true;
		resliceDown = true;
		if(!decoding && [self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (void) drawBezelWithFrame:(NSRect) frame inView:(NSView *) controlView {
	frame = NSInsetRect(frame,2,2);
	frame.size.height -= 2;
	NSString * path;
	if(!upImage && upImageName) upImage = [[NSImage imageNamed:upImageName] retain];
	if(!downImage && downImageName) downImage = [[NSImage imageNamed:downImageName] retain];
	if(upImageNameChanged) {
		upImageNameChanged = false;
		GDRelease(upImage);
		upImage = [[NSImage imageNamed:upImageName] retain];
		if(!upImage && isInInterfaceBuilder) {
			if(!document) document = [IBDocument performSelector:@selector(documentForObject:) withObject:self];
			upImage = [[document performSelector:@selector(documentImageNamed:) withObject:[upImageName stringByDeletingPathExtension]] retain];
			if(!upImage) {
				path = [gdKitIBBundle pathForResource:@"scale_nine_button_icon" ofType:@"png"];
				if([fileManager fileExistsAtPath:path]) upImage = [[NSImage alloc] initWithContentsOfFile:path];
			}
		}
	}
	if(downImageNameChanged) {
		downImageNameChanged = false;
		GDRelease(downImage);
		downImage = [[NSImage imageNamed:downImageName] retain];
		if(!downImage && isInInterfaceBuilder) {
			if(!document) document = [IBDocument performSelector:@selector(documentForObject:) withObject:self];
			downImage = [[document performSelector:@selector(documentImageNamed:) withObject:[downImageName stringByDeletingPathExtension]] retain];
			if(!downImage) {
				path = [gdKitIBBundle pathForResource:@"scale_nine_button_icon_down" ofType:@"png"];
				if([fileManager fileExistsAtPath:path]) downImage = [[NSImage alloc] initWithContentsOfFile:path];
			}
		}
	}
	if(!upImage && !downImage) {
		reslice = false;
		resliceUp = false;
		resliceDown = false;
		downImageNameChanged = false;
		upImageNameChanged = false;
		return;
	}
	if((resliceDown || reslice || lastDownSlicedImage != downImage) && downImage) {
		GDRelease(downSlices);
		downSlices = [sliceImageForDrawNine(downImage,cornerSize) retain];
		lastDownSlicedImage = downImage;
	}
	if((resliceUp || reslice || lastUpSlicedImage != upImage) && upImage) {
		GDRelease(upSlices);
		upSlices = [sliceImageForDrawNine(upImage,cornerSize) retain];
		lastUpSlicedImage = upImage;
	}
	sourceSlices = nil;
	reslice = false;
	if([self isHighlighted] && downSlices) sourceSlices = downSlices;
	if([self isHighlighted] && (!downImage || !downSlices) && upSlices) sourceSlices = upSlices;
	if(![self isHighlighted] && upSlices) sourceSlices = upSlices;
	if(![self isHighlighted] && (!upSlices || !upImage)) sourceSlices = nil;
	if(!sourceSlices || [sourceSlices count] < 9) return;
	NSDrawNinePartImage(frame,[sourceSlices objectAtIndex:0],[sourceSlices objectAtIndex:1],[sourceSlices objectAtIndex:2],
						[sourceSlices objectAtIndex:3],[sourceSlices objectAtIndex:4],[sourceSlices objectAtIndex:5],
						[sourceSlices objectAtIndex:6],[sourceSlices objectAtIndex:7],[sourceSlices objectAtIndex:8],
						NSCompositeSourceOver,1,[controlView isFlipped]);
}

- (void) dealloc {
	GDRelease(gdKitIBBundle);
	GDRelease(upImageName);
	GDRelease(downImageName);
	GDRelease(upSlices);
	GDRelease(downSlices);
	GDRelease(upImage);
	GDRelease(downImage);
	document = nil;
	sourceSlices = nil;
	fileManager = nil;
	lastUpSlicedImage = nil;
	lastDownSlicedImage = nil;
	cornerSizeWidth = 0;
	cornerSizeHeight = 0;
	IBDocument = 0;
	isInInterfaceBuilder = false;
	decoding = false;
	reslice = false;
	resliceUp = false;
	resliceDown = false;
	upImageNameChanged = false;
	downImageNameChanged = false;
	cornerSize = NSZeroSize;
	[super dealloc];
}

@end
