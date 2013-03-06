//
//  EmitterViewController.h
//  Emitter
//
//  Created by Scott Douglas on 3/3/13.
//  Copyright 2013 Scott Douglas. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Emitter.h"


@class EmitterView;


@interface EmitterViewController : UIViewController <EmitterDelegate> {
	EmitterView *emitterView;
	Emitter *emitter;
}


@property (nonatomic, retain, readonly) EmitterView *emitterView;
@property (nonatomic, retain, readonly) Emitter *emitter;


@end
