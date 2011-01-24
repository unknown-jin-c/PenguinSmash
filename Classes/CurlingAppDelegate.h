//
//  CurlingAppDelegate.h
//  Curling
//
//  Created by agnes on 11. 1. 15..
//  Copyright 우리집~ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface CurlingAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
