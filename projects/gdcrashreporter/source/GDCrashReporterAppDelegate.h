
#import <Cocoa/Cocoa.h>

@interface GDCrashReporterAppDelegate : NSObject <NSApplicationDelegate> {
	NSWindow * window;
	NSTextField * title;
	NSTextView * comments;
	NSTextView * ctext;
	NSImageView * icon;
	NSButton * save;
}

@property (retain,nonatomic) IBOutlet NSWindow * window;
@property (retain,nonatomic) IBOutlet NSTextField * title;
@property (retain,nonatomic) IBOutlet NSTextView * comments;
@property (retain,nonatomic) IBOutlet NSTextView * ctext;
@property (retain,nonatomic) IBOutlet NSImageView * icon;
@property (retain,nonatomic) IBOutlet NSButton * save;

- (IBAction) onCancel:(id) sender;
- (IBAction) onSend:(id) sender;
- (IBAction) onPromptChange:(id) sender;

@end
