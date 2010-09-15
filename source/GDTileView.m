
#import "GDTileView.h"

@implementation GDTileView
@synthesize tileImage;
@synthesize tileImageName;

- (id) initWithCoder:(NSCoder *) _coder {
	if(!(self=[super initWithCoder:_coder])) return nil;
	NSKeyedUnarchiver * unarchiver = (NSKeyedUnarchiver *)_coder;
	isInInterfaceBuilder = [self respondsToSelector:@selector(ibPopulateKeyPaths:)];
	IBDocument = NSClassFromString(@"IBDocument");
	document = [IBDocument performSelector:@selector(documentForObject:) withObject:self];
	gdKitIBBundle = [[NSBundle bundleWithIdentifier:@"com.macendeavor.GDKitMacIBAdditions"] retain];
	fileManager = [NSFileManager defaultManager];
	decoding = true;
	if([unarchiver containsValueForKey:@"GDTileView.tileImageName"]) [self setTileImageName:[unarchiver decodeObjectForKey:@"GDTileView.tileImageName"]];
	decoding = false;
	imageNameChanged = true;
	[self setNeedsDisplay:true];
	return self;
}

- (id) initWithFrame:(NSRect) framerect {
	if(!(self=[super initWithFrame:framerect])) return nil;
	isInInterfaceBuilder = [self respondsToSelector:@selector(ibPopulateKeyPaths:)];
	IBDocument = NSClassFromString(@"IBDocument");
	document = [IBDocument performSelector:@selector(documentForObject:) withObject:self];
	gdKitIBBundle = [[NSBundle bundleWithIdentifier:@"com.macendeavor.GDKitMacIBAdditions"] retain];
	fileManager = [NSFileManager defaultManager];
	return self;
}

- (void) encodeWithCoder:(NSCoder *) _coder {
	[super encodeWithCoder:_coder];
	NSKeyedArchiver * archiver = (NSKeyedArchiver *)_coder;
	[archiver encodeObject:tileImageName forKey:@"GDTileView.tileImageName"];
}

- (void) setTileImage:(NSImage *) _image {
	if(tileImage != _image) {
		[tileImage release];
		tileImage = [_image retain];
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (void) setTileImageName:(NSString *) _name {
	if(tileImageName != _name) {
		[tileImageName release];
		tileImageName = [_name copy];
		imageNameChanged = true;
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (void) drawRect:(NSRect) dirtyrect {
	[super drawRect:dirtyrect];
	if(!tileImage && tileImageName) tileImage = [[NSImage imageNamed:tileImageName] retain];
	if(imageNameChanged) {
		GDRelease(tileImage);
		tileImage = [[NSImage imageNamed:tileImageName] retain];
		if(!tileImage && isInInterfaceBuilder) {
			if(!document) document = [IBDocument performSelector:@selector(documentForObject:) withObject:self];
			tileImage = [[document performSelector:@selector(documentImageNamed:) withObject:[tileImageName stringByDeletingPathExtension]] retain];
			if(!tileImage) {
				NSString * path = [gdKitIBBundle pathForResource:@"diagonal_tile_small" ofType:@"png"];
				if([fileManager fileExistsAtPath:path]) tileImage = [[NSImage alloc] initWithContentsOfFile:path];
			}
		}
	}
	if(tileImage) {
		[NSGraphicsContext saveGraphicsState];
		NSGraphicsContext * context = [NSGraphicsContext currentContext];
		CGContextRef cgcontext = (CGContextRef)[context graphicsPort];
		CGImageRef image = [tileImage CGImage];
		CGRect imageRect = CGRectMake(0,0,[tileImage size].width,[tileImage size].height);
		CGContextClipToRect(cgcontext,CGRectMake(0.0, 0.0,[self bounds].size.width,[self bounds].size.height));
		CGContextDrawTiledImage(cgcontext,imageRect,image);
		CGImageRelease(image);
		[NSGraphicsContext restoreGraphicsState];
	}
}

- (void) dealloc {
	GDRelease(tileImage);
	GDRelease(tileImageName);
	GDRelease(gdKitIBBundle);
	document = nil;
	IBDocument = nil;
	fileManager = nil;
	imageNameChanged = false;
	decoding = false;
	isInInterfaceBuilder = false;
	[super dealloc];
}

@end
