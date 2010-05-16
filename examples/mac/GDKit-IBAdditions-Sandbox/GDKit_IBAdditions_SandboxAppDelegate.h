
#import <Cocoa/Cocoa.h>
#import <GDKit/GDKit.h>

@interface GDKit_IBAdditions_SandboxAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow * window;
	GDGradientBoxView * boxView;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic,retain) IBOutlet GDGradientBoxView * boxView;

@end
