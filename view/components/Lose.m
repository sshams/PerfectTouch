//
//  Lose.m
//  PerfectTouch
//
//  Created by Saad Shams on 4/30/11.
// All rights reserved.
//

#import "Lose.h"
#import "Animations.h"
#import "NSArrays.h"


@implementation Lose

@synthesize objects, name, delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        name = @"Lose";
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
    [Animations animateViewsFrom:objects x:0 y:10 width:0 height:0 relative:YES alpha:0 duration:.5 delay:0 stagger:.1 options:UIViewAnimationCurveEaseOut delegate:nil selector:nil];
}

- (void)animateInDidComplete {
    
}

- (void)animateOut {
    [Animations animateViewsTo:objects x:0 y:-10 width:0 height:0 relative:YES alpha:0 duration:.5 delay:0 stagger:.1 options:UIViewAnimationCurveEaseOut delegate:self selector:@selector(animateOutDidComplete)];
}

- (void)animateOutDidComplete {
    [delegate restart];
}

- (void)transitionOut {
}

- (void)transitionOutDidComplete {
}

- (void)reset {
    [Animations animateViewsTo:objects x:0 y:10 width:0 height:0 relative:YES alpha:1 duration:.5 delay:0 stagger:.1 options:UIViewAnimationCurveEaseOut delegate:nil selector:nil];
}

#pragma mark - Additional

- (IBAction)restart {
    [audioPlayer play];
    [self animateOut];
}

#pragma mark - Memory Management

- (void)dealloc
{
    [super dealloc];
    [audioPlayer release];
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
    [self setObjects:[NSArrays sort:objects initWithKey:@"tag"ascending:YES]];
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
