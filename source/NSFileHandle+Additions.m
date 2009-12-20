//copyright 2009 aaronsmith

#import "NSFileHandle+Additions.h"

@implementation NSFileHandle (Additions)

- (id) initWithFile:(NSString *) file {
	NSFileManager * fileManager = [NSFileManager defaultManager];
	if(![fileManager fileExistsAtPath:file]) return nil;
	int fd = open([file UTF8String],O_RDWR|O_CREAT, S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH|S_IWOTH);
	if(self = [self initWithFileDescriptor:fd closeOnDealloc:true]) {}
	else close(fd);
	return self;
}

- (id) initWithTruncatedFile:(NSString *) file {
	int fd = open([file UTF8String],O_RDWR|O_CREAT|O_TRUNC, S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH|S_IWOTH);
	if(self = [self initWithFileDescriptor:fd closeOnDealloc:true]) {}
	else close(fd);
	return self;
}


@end