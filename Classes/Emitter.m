//
//  Emitter.m
//  Emitter
//
//  Created by Scott Douglas on 3/4/13.
//  Copyright 2013 Scott Douglas. All rights reserved.
//


#import "Emitter.h"


@implementation Emitter


@synthesize delegate;


- (id)init {
	self = [super init];
	
	if (self) {
		rotation = 90.0;

		timer = [[NSTimer scheduledTimerWithTimeInterval:0.1
												 target:self
											     selector:@selector(onTimer)
											     userInfo:nil
												 repeats:YES] retain];
	}
	
	return self;
}


- (void)onTimer {
	rotation += 3.0;
	if (rotation > 360.0) {
		rotation -= 360.0;
	}
	
	CGFloat distance = 120.0;
	CGFloat radianRotation = rotation * M_PI / 180.0;
	CGFloat rise = sin(radianRotation) * distance;
	CGFloat run = cos(radianRotation) * distance;
	
	[delegate createObjectWithRise:rise	run:run];
}


- (void)dealloc {
	[timer release];
    [super dealloc];
}


@end
