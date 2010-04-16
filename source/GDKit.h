//copyright 2009 aaronsmith

/**
 * @file GDKit.h
 *
 * Framework header. Link against <b>GDKit.framework</b>
 * and <b>#import <GDKit/GDKit.h></b>.
 */

#import <Foundation/Foundation.h>
#import <CoreServices/CoreServices.h>
#import "macros.h"
#import "GDAccessibilityManager.h"
#import "GDAccessibilityNotification.h"
#import "GDAccessibilityObserver.h"
#import "GDAccessibilityOperationResult.h"
#import "GDASLLog.h"
#import "GDCarbonEvent.h"
#import "GDCarbonEventManager.h"
#import "GDQuartzDisplay.h"
#import "GDULimit.h"
#import "NSFileManager+Additions.h"
#import "NSUserDefaults+Additions.h"
#import "NSStatusItem+Additions.h"
#import "NSWorkspace+Additions.h"
#import "NSView+Additions.h"
#import "NSFileHandle+Additions.h"
#import "GDNSTaskOperation.h"
#import "GDOperation.h"
#import "GDCallback.h"
#import "GDMainMenuController.h"
#import "GDOperationsController.h"
#import "GDSoundController.h"
#import "GDCliProxy.h"
#import "GDCliProxyConnector.h"
#import "GDCrashReporter.h"
#import "GDCrashReporterDelegate.h"