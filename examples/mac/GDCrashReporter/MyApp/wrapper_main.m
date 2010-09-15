
#import <GDKit/GDKit.h>

int main(int argc, char ** argv) {
	printf("wrapper!");
	return GDCrashReporter_NSApplicationMain("com.gngrwzrd.MyApp2",argc,argv);
}