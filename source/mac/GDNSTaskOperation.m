//copyright 2009 aaronsmith

#import "GDNSTaskOperation.h"

@implementation GDNSTaskOperation

- (id) init {
	if(!(self=[super init]))return nil;
	stringEncoding=NSUTF8StringEncoding;
	return self;
}

- (void) prepareTask{}
- (void) taskComplete{}
- (void) validateTerminationStatus{}

- (void) initializeTask {
	task=[[NSTask alloc] init];
	[self prepareTask];
}

- (void) main {
	if(done)return;
	if(writesFileForTaskInput) {
		if(filePathToWriteTo is nil) {
			NSLog(@"GDKit Error ([GDBaseNSTaskOperation main]): writesFileForTaskInput was true, but filePathToWriteTo was nil");
			done=true;
			return;
		}
		[self writeFileForInput];
	}
	[task launch];
	if(readsSTOUT)[self readSTDOUT];
	if(done) return;
	if(readsSTERR)[self readSTDERR];
	if(done) return;
	[task waitUntilExit];
	if(done) return;
	taskTerminationStatus=[task terminationStatus];
	[self validateTerminationStatus];
	[self taskComplete];
	done=true;
}

- (void) updateArguments {
	[task setArguments:args];
}

- (void) writeFileForInput {
	NSString * path = [filePathToWriteTo stringByDeletingLastPathComponent];
	NSFileManager * fm = [NSFileManager defaultManager];
	[fm createDirectoryAtPath:path withIntermediateDirectories:true attributes:nil error:nil];
	fm=nil;
	path=nil;
	NSFileHandle * fh = [[NSFileHandle alloc] initWithTruncatedFile:filePathToWriteTo];
	NSData * content = [writeFileContents dataUsingEncoding:stringEncoding];
	[fh writeData:content];
	[fh release];
	fh=nil;
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
	if(task && [task isRunning])[task terminate];
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
