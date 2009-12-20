
#import <Cocoa/Cocoa.h>
#import "GDBaseOperation.h"
#import "macros.h"

/**
 * @file GDBaseNSTaskOperation.h
 * 
 * Header file for GDBaseNSTaskOperation.
 */

/**
 * The GDBaseNSTaskOperation is a base operation class that
 * executes an NSTask, and can read and store the stdout, and stderr
 * for use after the task executes.
 */
@interface GDBaseNSTaskOperation : GDBaseOperation {
	
	/**
	 * Whether or not this task should read standard out.
	 */
	BOOL readsSTOUT;
	
	/**
	 * Whether or not this task should read standard error.
	 */
	BOOL readsSTERR;
	
	/**
	 * The task's termination status.
	 */
	int taskTerminationStatus;
	
	/**
	 * UTF8 String container for the standard out contents.
	 */
	NSString * stout;
	
	/**
	 * UTF8 String container for the standard error contents.
	 */
	NSString * sterr;
	
	/**
	 * Task arguments.
	 */
	NSMutableArray * args;
	
	/**
	 * The NSTask instance used to execute this task.
	 */
	NSTask * task;
}

/**
 * Creates the NSTask and stores it into the task property.
 */
- (void) initializeTask;

/**
 * Thread entry point.
 */
- (void) main;

/**
 * Reads the standard error from the NSTask.
 */
- (void) readSTDERR;

/**
 * Reads the standard out from the NSTask.
 */
- (void) readSTDOUT;

/**
 * A hook you should override to prepate the task instance
 * with it's launch path, arguments, etc.
 */
- (void) prepareTask;

/**
 * A helper to update the arguments. All this does is
 * set args on the task.
 *
 * @code
 * [task setArguments:args];
 * @endcode
 */
- (void) updateArguments;

/**
 * A hook you can use to do something with the taskTerminationStatus
 * variable.
 */
- (void) validateTerminationStatus;

/**
 * A hook you should override to do something when this task is complete.
 * This method is still executing as part of the operation but after
 * this method finishes the thread will exit.
 */
- (void) taskComplete;

@end
