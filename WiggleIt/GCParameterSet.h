//
//  GCParameterSet.h
//  WiggleIt
//
//  Created by Johannes Drever on 8/19/12.
//  Copyright (c) 2012 Johannes Drever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCParameterSet : NSObject
@property double frameRate;

@property double deltaT;
@property double mu;

@property double alpha;

@property double beta;
@property double gamma;
@property double omega;
@property double A;
@property double B;
@end
