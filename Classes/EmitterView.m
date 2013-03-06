//
//  EmitterView.m
//  Emitter
//
//  Created by Scott Douglas on 3/3/13.
//  Copyright 2013 Scott Douglas. All rights reserved.
//


#import <QuartzCore/QuartzCore.h>
#import "EmitterView.h"


@implementation EmitterView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        bgColor = [[UIColor colorWithRed:40/255.0f green:129/255.0f blue:133/255.0f alpha:1.0f] retain];
        fgColor = [[UIColor colorWithRed:255/255.0f green:0/255.0f blue:0/255.0f alpha:0.5f] retain];
		
		CGRect frameBounds = [self bounds];
		
		CGMutablePathRef bgPath = CGPathCreateMutable();
		CGPathMoveToPoint(bgPath, NULL, CGRectGetMinX(frameBounds), CGRectGetMinY(frameBounds));
		CGPathAddLineToPoint(bgPath, NULL, CGRectGetMinX(frameBounds), CGRectGetMaxY(frameBounds));
		CGPathAddLineToPoint(bgPath, NULL, CGRectGetMaxX(frameBounds), CGRectGetMaxY(frameBounds));
		CGPathAddLineToPoint(bgPath, NULL, CGRectGetMaxX(frameBounds), CGRectGetMinY(frameBounds));
		CGPathCloseSubpath(bgPath);
		
		CAShapeLayer *bgShapeLayer = [CAShapeLayer layer];
		bgShapeLayer.path = bgPath;
		bgShapeLayer.bounds = [self bounds];
		bgShapeLayer.fillColor = [bgColor CGColor];
		bgShapeLayer.anchorPoint = CGPointMake(0.0, 0.0);
		
		[[self layer] addSublayer:bgShapeLayer];
	}
    return self;
}


- (void)createShapeLayerWithRise:(CGFloat)rise run:(CGFloat)run {
	CGRect frameBounds = [self bounds];
	
	CGMutablePathRef path = CGPathCreateMutable();
	CGPathMoveToPoint(path, NULL, 0.0, 0.0);
	CGPathAddLineToPoint(path, NULL, 0.0, 25.0);
	CGPathAddLineToPoint(path, NULL, 25.0, 25.0);
	CGPathAddLineToPoint(path, NULL, 25.0, 0.0);
	CGPathCloseSubpath(path);
	
	CGFloat frameMidPointX = (CGRectGetMaxX(frameBounds) - CGRectGetMinX(frameBounds)) / 2.0;
	CGFloat frameMidPointY = (CGRectGetMaxY(frameBounds) - CGRectGetMinY(frameBounds)) / 2.0;
	
	CAShapeLayer *shapeLayer = [CAShapeLayer layer];
	shapeLayer.path = path;
	shapeLayer.bounds = CGPathGetBoundingBox(path);
	shapeLayer.fillColor = [fgColor CGColor];
	shapeLayer.position = CGPointMake(frameMidPointX, frameMidPointY);
	shapeLayer.opacity = 0.5f;
	
	NSUInteger layerIndex = [self.layer.sublayers count];
	
	[[self layer] addSublayer:shapeLayer];
	
	CABasicAnimation* rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	[rotateAnimation setDuration:10.0];
	[rotateAnimation setRepeatCount:INT_MAX];
	[rotateAnimation setFromValue:[NSNumber numberWithFloat:0] ];
	[rotateAnimation setToValue:[NSNumber numberWithFloat:M_PI * 2.0]];
	[[self.layer.sublayers objectAtIndex:layerIndex] addAnimation:rotateAnimation forKey:@"rotate"];	
	
	CABasicAnimation* translateYAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
	translateYAnimation.toValue = [NSNumber numberWithFloat:rise];
	translateYAnimation.duration = 1;
	translateYAnimation.cumulative = YES;
	translateYAnimation.repeatCount = 1.0; 
	translateYAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	translateYAnimation.removedOnCompletion = NO;
	translateYAnimation.fillMode = kCAFillModeForwards;
	[[self.layer.sublayers objectAtIndex:layerIndex] addAnimation:translateYAnimation forKey:@"translatey"];	
	
	CABasicAnimation* translateXAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
	translateXAnimation.toValue = [NSNumber numberWithFloat:run];
	translateXAnimation.duration = 1;
	translateXAnimation.cumulative = YES;
	translateXAnimation.repeatCount = 1.0; 
	translateXAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	translateXAnimation.removedOnCompletion = NO;
	translateXAnimation.fillMode = kCAFillModeForwards;
	[[self.layer.sublayers objectAtIndex:layerIndex] addAnimation:translateXAnimation forKey:@"translatex"];	
}


- (void)dealloc {
	[fgColor release];
	[bgColor release];
    [super dealloc];
}


@end
