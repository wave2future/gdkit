//copyright 2009 aaronsmith

#import <Cocoa/Cocoa.h>

@interface GDDisplayState : NSObject {
	NSScreen * mainDisplay;
	NSMutableArray * nonMainDisplays;
	NSMutableArray * allDisplays;
}

//@property (retain) NSScreen * mainDisplay;

/**
 * Whether or not the current display configuration
 * matches what this display state describes.

- (Boolean) isCurrentConfiguration;

/**
 * Maps an NSRect into the coordinates of the main display

- (NSRect) mapRectIntoThisDisplay:(NSRect *) rectToMap;

/**
 * Adds a display to this state.

- (void) addDisplay:(NSScreen *) screen;
 */
 
@end
