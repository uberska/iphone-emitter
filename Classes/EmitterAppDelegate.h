//
//  EmitterAppDelegate.h
//  Emitter
//
//  Created by Scott Douglas on 3/3/13.
//  Copyright Scott Douglas 2013. All rights reserved.
//


#import <UIKit/UIKit.h>


@class EmitterViewController;


@interface EmitterAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	EmitterViewController *emitterViewController;
}


@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet EmitterViewController *emitterViewController;


@end

