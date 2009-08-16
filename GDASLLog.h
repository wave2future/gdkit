//copyright 2009 aaronsmith

#include <asl.h>
#import <Cocoa/Cocoa.h>

/**
 * Forward declaration.
 */
@class GDASLLogManager;

@interface GDASLLog : NSObject {
	
	/**
	 * File descriptor for log file.
	 */
	int fd;
	
	/**
	 * Apple Sys Log client.
	 */
	aslclient client;
	
	/**
	 * The log manager.
	 */
	GDASLLogManager * manager;
	
	/**
	 * property for logToStdOut.
	 */
	Boolean logToStdOut;
}

/**
 * Whether or not to throw all messages to
 * stdout as well.
 */
@property (assign) Boolean logToStdOut;

/**
 * Initialize with the sender, facility, and whether
 * or not to connect immediately. The sender and facility
 * correlate to log output. Usually the sender is name of
 * your app, and the facility is the bundle identifier.
 */
- (id) initWithSender:(NSString *) sender facility:(NSString *) facility connectImmediately:(Boolean) connectImmediately;

/**
 * Set's a log file to write all logs to. If this log
 * file isn't set, the logs aren't stored, however they
 * are visible in the console.
 */
- (int) setLogFile:(NSString *) filePath;

/**
 * Alert message.
 */
- (void) alert:(NSString *) message;

/**
 * Critical message.
 */
- (void) critical:(NSString *) message;

/**
 * Debug message.
 */
- (void) debug:(NSString *) message;

/**
 * Emergency message.
 */
- (void) emergency:(NSString *) message;

/**
 * Error message.
 */
- (void) error:(NSString *) message;

/**
 * Info message.
 */
- (void) info:(NSString *) message;

/**
 * Notice message.
 */
- (void) notice:(NSString *) message;

/**
 * Warning message.
 */
- (void) warning:(NSString *) message;

/**
 * Close this log. If you call close directlyk
 * this log won't work anymore. Close will be
 * called when this object is deallocated.
 */
- (void) close;

@end
