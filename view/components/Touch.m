//
//  Touch.m
//  PerfectTouch
//
//  Created by Saad Shams on 4/28/11.
//  All rights reserved.
//

#import "Touch.h"
#import "NSArrays.h"
#import "Animations.h"


@implementation Touch

@synthesize objects, timer, delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        toShow = -1;
        toHide = -1;
        buttonsEnabled = NO;
        interval = 1;
        isTimerStarted = NO;
        
        audioPlayer = [[AudioPlayer alloc] init:@"click" ofType:@"mp3"];
    }
    return self;
}

#pragma mark - AnimationDelegate Methods

- (void)transitionIn {
}

- (void)transitionInDidComplete {
}

- (void)animateIn {
    [Animations animateViewsFrom:objects x:0 y:20 width:0 height:0 relative:YES alpha:0 duration:.5 delay:0 stagger:.1 options:UIViewAnimationCurveEaseOut delegate:self selector:@selector(animateInDidComplete)];
}

- (void)animateInDidComplete {
    [Animations animateViewTo:background x:0 y:0 width:0 height:0 relative:YES alpha:1 duration:.5 delay:.5 options:UIViewAnimationCurveEaseOut delegate:nil selector:nil];
    [Animations animateViewsTo:objects x:0 y:0 width:0 height:0 relative:YES alpha:0 duration:.5 delay:.5 stagger:.1 options:UIViewAnimationCurveEaseOut delegate:self selector:@selector(enableButtons)];
}

- (void)animateOut {
    
}

- (void)animateOutDidComplete {
    
}

- (void)transitionOut {
    [Animations animateViewTo:self.view x:0 y:0 width:0 height:0 relative:YES alpha:0 duration:.5 delay:1 options:UIViewAnimationCurveEaseOut delegate:self selector:@selector(transitionOutDidComplete)];
}

- (void)transitionOutDidComplete {
}

- (void)reset {
    [self.view setAlpha:1];
    [background setAlpha:0];
    [Animations animateViewsTo:objects x:0 y:0 width:0 height:0 relative:YES alpha:1 duration:.1 delay:0 stagger:0 options:UIViewAnimationCurveEaseOut delegate:nil selector:nil];
    isTimerStarted = NO;
}

#pragma mark - Additional

- (void)enableButtons {
    buttonsEnabled = YES;
    [self startTimer];
}

- (void)disableButtons {
    buttonsEnabled = NO;
}

- (void)startTimer {
    showTimer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(showArrow) userInfo:nil repeats:YES];
    
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:showTimer forMode:NSDefaultRunLoopMode];
}

- (void)showArrow {
    if(!isTimerStarted){
        [delegate startTimer];
        isTimerStarted = YES;
    }
    
    do {
        toShow = arc4random() % [objects count];
    } while (toShow == toHide);
    
    UIButton *button = [objects objectAtIndex:toShow];
    [Animations animateViewTo:button x:0 y:0 width:0 height:0 relative:YES alpha:1 duration:.5 delay:0 options:UIViewAnimationCurveLinear delegate:self selector:@selector(showArrowDidComplete)];
    
    hideTimer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(hideArrow) userInfo:nil repeats:NO];
}

- (void)showArrowDidComplete {
    toHide = toShow;
}

- (void)hideArrow {
    UIButton *button = [objects objectAtIndex:toHide];
    [Animations animateViewTo:button x:0 y:0 width:0 height:0 relative:YES alpha:0 duration:.5 delay:0 options:UIViewAnimationCurveLinear delegate:nil selector:nil];
}

- (void)stopTimer {
    [showTimer invalidate];
    
    [self transitionOut];
}

- (void)increment {
    if(buttonsEnabled){
        [audioPlayer play];
        [delegate increment];
    }
}

- (void)resetArrows {
    [Animations animateViewsTo:objects x:0 y:0 width:0 height:0 relative:YES alpha:0 duration:.1 delay:0 stagger:0 options:UIViewAnimationCurveEaseOut delegate:self selector:@selector(transitionOut)];
}

#pragma mark - Memory Management

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setObjects:[NSArrays sort:objects initWithKey:@"tag" ascending:YES]];
    [background setAlpha:0];
    
    int count = [objects count];
    for (int i=0; i<count; i++) {
        UIButton *button = [objects objectAtIndex:i];
        [button addTarget:self action:@selector(increment) forControlEvents:UIControlEventTouchDown];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
