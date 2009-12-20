
#import "GDBaseNSTaskOperation.h"

@implementation GDBaseNSTaskOperation

- (void) taskComplete{}
- (void) validateTerminationStatus{}
- (void) prepareTask{}

- (void) initializeTask {
	task=[[NSTask alloc] init];
	[self prepareTask];
}

- (void) main {
	if(done)return;
	[task launch];
	if(readsSTOUT)[self readSTDOUT];
	if(readsSTERR)[self readSTDERR];
	[task waitUntilExit];
	if(done)return;
	taskTerminationStatus=[task terminationStatus];
	[self validateTerminationStatus];
	[self taskComplete];
	done=true;
}

- (void) updateArguments {
	[task setArguments:args];
}

- (void) readSTDOUT {
	NSFileHandle * s=[[task standardOutput] fileHandleForReading];
	NSData * content=[s readDataToEndOfFile];
	stout=[[NSString alloc] initWithData:content encoding:NSUTF8StringEncoding];
}

- (void) readSTDERR {
	NSFileHandle * s=[[task standardError] fileHandleForReading];
	NSData * content=[s readDataToEndOfFile];
	sterr=[[NSString alloc] initWithData:content encoding:NSUTF8StringEncoding];
}

- (void) cancel {
	[super cancel];
	done=true;
	if(task not nil)[task terminate];
}

- (void) dealloc {
	GDRelease(task);
	GDRelease(args);
	GDRelease(sterr);
	GDRelease(stout);
	readsSTERR=false;
	readsSTOUT=false;
	[super dealloc];
}

@end
