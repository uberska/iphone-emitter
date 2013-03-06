//
//  Emitter.h
//  Emitter
//
//  Created by Scott Douglas on 3/4/13.
//  Copyright 2013 Scott Douglas. All rights reserved.
//


#import <Foundation/Foundation.h>


@class CAShapeLayer;
@class NSTimer;


@protocol EmitterDelegate <NSObject>
@optional
- (void)createObjectWithRise:(CGFloat)rise run:(CGFloat)run;
@end


@interface Emitter : NSObject {
	CGFloat rotation;
	NSTimer *timer;
	id<EmitterDelegate> delegate;
}


@property (nonatomic, assign) id <EmitterDelegate> delegate;


@end
