//
//  EmitterView.h
//  Emitter
//
//  Created by Scott Douglas on 3/3/13.
//  Copyright 2013 Scott Douglas. All rights reserved.
//


#import <UIKit/UIKit.h>


@class CAShapeLayer;


@interface EmitterView : UIView {
	UIColor *bgColor;
	UIColor *fgColor;
}

- (void)createShapeLayerWithRise:(CGFloat)rise run:(CGFloat)run;


@end
