
#import "GDTileView.h"

@implementation GDTileView
@synthesize tileImage;
@synthesize tileImageName;

- (id) initWithCoder:(NSCoder *) _coder {
	if(!(self=[super initWithCoder:_coder])) return nil;
	NSKeyedUnarchiver * unarchiver = (NSKeyedUnarchiver *)_coder;
	decoding=true;
	if([unarchiver containsValueForKey:@"GDTileView.tileImageName"]) [self setTileImageName:[unarchiver decodeObjectForKey:@"GDTileView.tileImageName"]];
	decoding=false;
	[self setNeedsDisplay:true];
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
		hasTileImageNameChanged = true;
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (void) drawRect:(NSRect) dirtyrect {
	[super drawRect:dirtyrect];
	if([self respondsToSelector:@selector(ibPopulateKeyPaths:)]) {
		Class IBDocument = NSClassFromString(@"IBDocument");
		if(IBDocument) {
			BOOL drawTemplate = false;
			id document = [IBDocument performSelector:@selector(documentForObject:) withObject:self];
			if(hasTileImageNameChanged) {
				hasTileImageNameChanged = false;
				if(tileImage) [tileImage release];
				tileImage = [[document performSelector:@selector(documentImageNamed:) withObject:[tileImageName stringByDeletingPathExtension]] retain];
			}
			if(!tileImage) drawTemplate = true;
			if(drawTemplate) {
				NSBundle * bundle = [NSBundle bundleWithIdentifier:@"com.macendeavor.GDKitMacIBAdditions"];
				NSString * path = [bundle pathForResource:@"diagonal_tile_small" ofType:@"png"];
				if(path) tileImage = [[NSImage alloc] initWithContentsOfFile:path];
			}
		}
	}
	if(tileImage) {
		[NSGraphicsContext saveGraphicsState];
		NSGraphicsContext * context = [NSGraphicsContext currentContext];
		CGContextRef cgcontext = (CGContextRef)[context graphicsPort];
		CGImageRef image = [tileImage CGImageForProposedRect:NULL context:context hints:nil];
		CGRect imageRect;
		imageRect.origin=CGPointMake(0.0,0.0);
		imageRect.size=CGSizeMake([tileImage size].width,[tileImage size].width);
		CGContextClipToRect(cgcontext,CGRectMake(0.0, 0.0,[self bounds].size.width,[self bounds].size.height));
		CGContextDrawTiledImage(cgcontext,imageRect,image);
		[NSGraphicsContext restoreGraphicsState];
	}
}

- (void) dealloc {
	GDRelease(tileImage);
	GDRelease(tileImageName);
	hasTileImageNameChanged=false;
	decoding=false;
	[super dealloc];
}

@end
