//
//  GCParameterSet.m
//  WiggleIt
//
//  Created by Johannes Drever on 8/19/12.
//  Copyright (c) 2012 Johannes Drever. All rights reserved.
//

#import "GCParameterSet.h"

@implementation GCParameterSet


-(id)init{
    self = [super init];
    

    
    self.frameRate =  1.0 / 60.0;
    self.deltaT =  0.01;
    
    self.mu = 1;
    
    self.alpha = 0.641;
    self.beta =  0.05;
    self.gamma = 12.457;
    self.omega =  2.5 * 2 * 3.142;
    
    self.A =  -0.125;
    self.B = -0.025;
    
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
