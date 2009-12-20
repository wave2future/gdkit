
#import "TDocument.h"

@implementation TDocument

- (void) initDocument {
	TModel * mdl = [[[TModel alloc] init] autorelease];
	TMainMenuController * mmc = [[[TMainMenuController alloc] init] autorelease];
	TModalController * mdls = [[[TModalController alloc] init] autorelease];
	TOperationsController * ops = [[[TOperationsController alloc] init] autorelease];
	TSoundController * snds = [[[TSoundController alloc] init] autorelease];
	TContextMenuController * cx = [[[TContextMenuController alloc] init] autorelease];
	[self lazyInitWithModel:mdl mainMenu:mmc modals:mdls operations:ops windows:wins drawers:nil views:views sounds:snds contexts:cx];
	[super initDocument];
}

- (void) initModel {
	//NSLog(@"initModel");
	GDApplicationInfo * app = [[GDApplicationInfo alloc] init];
	[model setAppInfo:app];
}

- (void) initViews {
	//NSLog(@"initViews");
}

- (void) initWindows {
	//NSLog(@"initWindows");
}

- (void) initControllers {
	//NSLog(@"initControllers");
}

- (void) startDocument {
	//NSLog(@"startDocument");
	//kick start anything from here, these are just examples.
	[views showCustomView];
	[sounds pop];
}

/*********/
//from here down you can expose target/action, callbacks, etc.
/*********/

- (IBAction) hello:(id) sender {
	NSLog(@"HELLO! %@",self);
}

- (void) dealloc {
	printf("dealloc TDocument\n");
	[super dealloc];
}

/*********/
//from here down is stub code you can fill out - code that was originally
//in this file when the project was created.
/*********/

- (NSString *) windowNibName {
	//override returning the nib file name of the document
	//if you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
	return @"TDocument";
}

- (NSData *) dataOfType:(NSString *) typeName error:(NSError **) outError {
	//insert code here to write your document to data of the specified type. If the given outError != NULL, ensure that you set *outError when returning nil
	//you can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
	//for applications targeted for Panther or earlier systems, you should use the deprecated API -dataRepresentationOfType:. In this case you can also choose to override -fileWrapperRepresentationOfType: or -writeToFile:ofType: instead.
	if(outError!=nil) {
		*outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
	}
	return nil;
}

- (BOOL) readFromData:(NSData *) data ofType:(NSString *) typeName error:(NSError **) outError {
	//insert code here to read your document from the given data of the specified type.  If the given outError != NULL, ensure that you set *outError when returning NO.
	//you can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead. 
	//for applications targeted for Panther or earlier systems, you should use the deprecated API -loadDataRepresentation:ofType. In this case you can also choose to override -readFromFile:ofType: or -loadFileWrapperRepresentation:ofType: instead.
	if(outError not nil) {
		*outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
	}
	return YES;
}

@end
