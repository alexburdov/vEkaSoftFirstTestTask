//
//  vEkaSoftFirstTestTaskAppDelegate.m
//  vEkaSoftFirstTestTask
//
//  Created by Alexander Burdovitzin on 4/16/11.
//  Copyright 2011 Home. All rights reserved.
//

#import "vEkaSoftFirstTestTaskAppDelegate.h"

@implementation vEkaSoftFirstTestTaskAppDelegate

@synthesize window = _window;

@synthesize navigationController = _navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

- (void)dealloc {
    [_window release];
    [_navigationController release];
    [super dealloc];
}

@end
