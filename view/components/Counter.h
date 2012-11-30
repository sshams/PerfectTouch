//
//  Counter.h
//  PerfectTouch
//
//  Created by Saad Shams on 4/29/11.
//  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationDelegate.h"

@protocol CounterDelegate <NSObject>

- (void)next:(BOOL)result;

@end

@interface Counter : UIViewController<AnimationDelegate> {
    IBOutlet UILabel *counterLabel;
    int counter;
    BOOL success;
    id<CounterDelegate>delegate;
}

@property (nonatomic, retain) id<CounterDelegate>delegate;

- (void)increment;
- (NSString *)format;
- (void)getResult;
- (void)reset;

@end
