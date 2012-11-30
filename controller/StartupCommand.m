//
//  StartupCommand.m
//  PerfectTouch
//
//  Created by Saad Shams on 4/28/11.
//  All rights reserved.
//

#import "StartupCommand.h"
#import "PerfectTouch.h"
#import "PerfectTouchMediator.h"
#import "IntroMediator.h"
#import "TouchMediator.h"
#import "CounterMediator.h"
#import "ClockMediator.h"
#import "ResultMediator.h"


@implementation StartupCommand

- (void)execute:(id<INotification>)notification {
    PerfectTouch *app = [notification body];
    
    [facade registerMediator:[PerfectTouchMediator withViewComponent:app]];
    [facade registerMediator:[IntroMediator withViewComponent:app.intro]];
    [facade registerMediator:[TouchMediator withViewComponent:app.touch]];
    [facade registerMediator:[CounterMediator withViewComponent:app.counter]];
    [facade registerMediator:[ClockMediator withViewComponent:app.clock]];
    [facade registerMediator:[ResultMediator withViewComponent:app.win]];
    [facade registerMediator:[ResultMediator withViewComponent:app.lose]];
}

@end
