//
//  AppDelegate.h
//  DoodleJump
//
//  Created by Dmitry Ivanov on 8/18/11.
//  Copyright ___ORGANIZATIONNAME___ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
