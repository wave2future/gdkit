
#import <Cocoa/Cocoa.h>
#import "GDBaseObject.h"

@interface GDCliProxy : GDBaseObject {
	NSConnection * connection;
}

@property (retain) NSConnection * connection;

- (void) connectWithConnectionName:(NSString *) connectionName;

@end
