//
//  EmitterViewController.m
//  Emitter
//
//  Created by Scott Douglas on 3/3/13.
//  Copyright 2013 Scott Douglas. All rights reserved.
//


#import <QuartzCore/QuartzCore.h>
#import "Emitter.h"
#import "EmitterView.h"
#import "EmitterViewController.h"


@implementation EmitterViewController


@synthesize emitterView;
@synthesize emitter;


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
	
	emitterView = [[[EmitterView alloc] initWithFrame:applicationFrame] autorelease];
	
	emitter = [[[Emitter alloc] init] autorelease];
	[emitter setDelegate:self];
	
	self.view = emitterView;
}


- (void)createObjectWithRise:(CGFloat)rise run:(CGFloat)run {
	[emitterView createShapeLayerWithRise:rise run:run];
}


- (void)dealloc {
	[emitter release];
	[emitterView release];
    [super dealloc];
}


@end
