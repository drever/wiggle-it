//
//  GCFinger.h
//  WiggleIt
//
//  Created by Johannes Drever on 8/18/12.
//  Copyright (c) 2012 Johannes Drever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCFingerView : UIView

@property double x1;
@property double y1;

@property double xdot1;
@property double ydot1;

@property double xddot1;
@property double yddot1;

@property double x2;
@property double y2;

@property double xdot2;
@property double ydot2;

@property double xddot2;
@property double yddot2;

@property double xmax;
@property double xmin;

@property double ymin;
@property double ymax;

@property CGAffineTransform t;
@property CGAffineTransform it;

@property CGPoint scaleFactor;
@property CGSize dotSize;
@end
