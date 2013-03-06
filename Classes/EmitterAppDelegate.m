//
//  EmitterAppDelegate.m
//  Emitter
//
//  Created by Scott Douglas on 3/3/13.
//  Copyright Scott Douglas 2013. All rights reserved.
//


#import "EmitterAppDelegate.h"
#import "EmitterViewController.h"


@implementation EmitterAppDelegate


@synthesize window;
@synthesize emitterViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	self.emitterViewController = [[[EmitterViewController alloc] init] autorelease];
	[window addSubview:self.emitterViewController.view];
	
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
	[emitterViewController release];
    [super dealloc];
}


@end
