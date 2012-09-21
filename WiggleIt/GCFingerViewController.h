//
//  GCFingerViewController.h
//  WiggleIt
//
//  Created by Johannes Drever on 8/17/12.
//  Copyright (c) 2012 Johannes Drever. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GCFingerView.h"
#import "GCParameterSet.h"
#import "GCOscillator.h"

@interface GCFingerViewController : UIViewController<UIGestureRecognizerDelegate>

@property GCFingerView *fingerView;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tabGestureRecognizer;

@property GCParameterSet *parameterSet;
@property GCOscillator *oscillator;
@property BOOL humanInteraction;

@property NSTimer *timer;

//TODOS
/*
1) Show a graph with the relative phase.
2) Record the time series for later analysis.
3) Show a pictogram of the potential and a dot inidcating the relative phase of the HKB.
4) Make the coupling configurable with a drop down menu.
5) Decide how the parameter ranges can be configured.
6) Choose one parameter and make it controllable in the FingerView.
 */
@end
