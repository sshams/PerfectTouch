//
//  ApplicationFacade.m
//  PerfectTouch
//
//  Created by Saad Shams on 4/28/11.
// All rights reserved.
//

#import "ApplicationFacade.h"
#import "StartupCommand.h"


@implementation ApplicationFacade

+ (ApplicationFacade *)getInstance {
    return (ApplicationFacade *)[super getInstance];
}

- (void)initializeController {
    [super initializeController];
    [self registerCommand:Startup commandClassRef:[StartupCommand class]];
}

- (void)startup:(id)app {
    [self sendNotification:Startup body:app];
}

@end
