//copyright 2009 aaronsmith

/**
 * @file GDKit-Mac.h
 *
 * Framework header. Link against <b>GDKit.framework</b>
 * and <b>#import <GDKit/GDKit.h></b>.
 */

#import <Foundation/Foundation.h>
#import <CoreServices/CoreServices.h>
#import "GDAccessibilityManager.h"
#import "GDAccessibilityNotification.h"
#import "GDAccessibilityObserver.h"
#import "GDAccessibilityOperationResult.h"
#import "GDASLLog.h"
#import "GDBHelpers.h"
#import "GDCallback.h"
#import "GDCarbonEvent.h"
#import "GDCarbonEventManager.h"
#import "GDCliProxy.h"
#import "GDCliProxyConnector.h"
#import "GDCrashFinder.h"
#import "GDCrashReporter.h"
#import "GDCrashReporter_NSApplicationMain.h"
#import "GDCrashReporterDelegate.h"
#import "GDDrawingUtils.h"
#import "GDGradientBoxView.h"
#import "GDMainMenuController.h"
#import "GDNSTaskOperation.h"
#import "GDOperation.h"
#import "GDOperationsController.h"
#import "GDPrintUtils.h"
#import "GDQuartzDisplay.h"
#import "GDQuartzUtils.h"
#import "GDScale3Button.h"
#import "GDScale3ButtonCell.h"
#import "GDScale3View.h"
#import "GDScale9Button.h"
#import "GDScale9ButtonCell.h"
#import "GDScale9View.h"
#import "GDSoundController.h"
#import "GDTileView.h"
#import "GDULimit.h"
#import "macros.h"
#import "NSControl+Additions.h"
#import "NSFileHandle+Additions.h"
#import "NSFileManager+Additions.h"
#import "NSImage+Additions.h"
#import "NSObject+Additions.h"
#import "NSStatusItem+Additions.h"
#import "NSString+Additions.h"
#import "NSUserDefaults+Additions.h"
#import "NSView+Additions.h"
#import "NSWorkspace+Additions.h"
#import "OSType.h"