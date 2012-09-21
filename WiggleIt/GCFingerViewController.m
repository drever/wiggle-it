//
//  GCFingerViewController.m
//  WiggleIt
//
//  Created by Johannes Drever on 8/17/12.
//  Copyright (c) 2012 Johannes Drever. All rights reserved.
//

#import "GCFingerViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface GCFingerViewController ()
-(void)updateFinger;
-(void)configureFingerView;
@end

@implementation GCFingerViewController
@synthesize tabGestureRecognizer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureFingerView];
        
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.parameterSet.frameRate target:self selector:@selector(updateFinger) userInfo:nil repeats:YES];
                  
    self.tabGestureRecognizer.delegate = self;
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
}

- (void)viewDidUnload
{
    [self setTabGestureRecognizer:nil];
    [super viewDidUnload];
}

-(void)configureFingerView{
    [self.fingerView removeFromSuperview];
    
    self.fingerView = [[GCFingerView alloc] initWithFrame:self.view.bounds];
    self.fingerView.layer.backgroundColor = [UIColor blackColor].CGColor;
    
    self.fingerView.xmax = 1;
    self.fingerView.xmin = -1;
    self.fingerView.ymin = -1;
    self.fingerView.ymax = 1;
    
    self.fingerView.x1 = 0;
    self.fingerView.y1 = -1;
    
    self.fingerView.xdot1 = 0;
    self.fingerView.ydot1 = 0;
    
    self.fingerView.yddot1 = 0;
    self.fingerView.xddot1 = 0;
    
    self.fingerView.x2 = 1;
    self.fingerView.y2 = 1;
    
    [self.view addSubview:self.fingerView];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [self configureFingerView];
}
-(void)updateFinger{

    double x = self.fingerView.x1;
    double y = self.fingerView.x2;
    
    double xd = self.fingerView.xdot1;
    double yd = self.fingerView.xdot2;

    double xdd = self.fingerView.xddot1;
    double ydd = self.fingerView.xddot2;

    xdd = (xd - self.parameterSet.mu * yd) * (self.parameterSet.A + self.parameterSet.B * pow((x - self.parameterSet.mu * y), 2)) - pow(self.parameterSet.omega, 2) * x - xd * (self.parameterSet.alpha * pow(x, 2) + self.parameterSet.beta * pow(xd, 2) - self.parameterSet.gamma);
    xd += self.parameterSet.deltaT * xdd;
    x += self.parameterSet.deltaT * xd;
    
    ydd = (yd - self.parameterSet.mu * yd) * (self.parameterSet.A + self.parameterSet.B * pow((y - self.parameterSet.mu * y), 2)) - pow(self.parameterSet.omega, 2) * y - yd * (self.parameterSet.alpha * pow(y, 2) + self.parameterSet.beta * pow(yd, 2) - self.parameterSet.gamma);
    yd += self.parameterSet.deltaT * ydd;
    y += self.parameterSet.deltaT * yd;
    
    if(self.humanInteraction == YES){
        self.fingerView.x1 = x;
    }
    self.fingerView.x2 = y;

    self.fingerView.xdot1 = xd;
    self.fingerView.xdot2 = yd;
    
    self.fingerView.xddot1 = xdd;
    self.fingerView.xddot2 = ydd;
    
    [self.fingerView setNeedsDisplay];
    
//    NSLog(@"%f %f", self.fingerView.x1, self.fingerView.xdot1);
}
- (IBAction)tabRecognized:(id)sender {
    [[self presentingViewController] dismissModalViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    CGPoint location = [touch locationInView:self.fingerView];
    location = CGPointApplyAffineTransform(location, self.fingerView.it);
    self.fingerView.x1 = location.x;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    CGPoint location = [touch locationInView:self.fingerView];
    location = CGPointApplyAffineTransform(location, self.fingerView.it);
    
    self.fingerView.x1 = location.x;
}
@end
