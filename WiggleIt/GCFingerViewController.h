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

@property  GCParameterSet *parameterSet;
@property GCOscillator *oscillator;


@property NSTimer *timer;
@end
