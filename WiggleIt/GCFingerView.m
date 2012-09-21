//
//  GCFinger.m
//  WiggleIt
//
//  Created by Johannes Drever on 8/18/12.
//  Copyright (c) 2012 Johannes Drever. All rights reserved.
//

#import "GCFingerView.h"

@implementation GCFingerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    
    self.scaleFactor = CGPointMake(80, 80);
    self.dotSize = CGSizeMake(30.0 * 1 / self.scaleFactor.x, 30.0 * 1 / self.scaleFactor.y);
    
    CGAffineTransform translate = CGAffineTransformMakeTranslation(self.bounds.size.width / 2, self.bounds.size.height / 2);
    CGAffineTransform scale = CGAffineTransformMakeScale(self.scaleFactor.x, self.scaleFactor.y);
    CGAffineTransform flip = CGAffineTransformIdentity;
    flip.d = -1;
    
    self.t =  CGAffineTransformConcat(flip,
                                    CGAffineTransformConcat(scale, translate
                                     ));
    
    self.it = CGAffineTransformInvert(self.t);
    
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextConcatCTM(context, self.t);
    
//    context
    CGContextClearRect(context,  CGRectApplyAffineTransform(self.bounds, self.it));
    
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0);
	CGContextSetLineWidth(context, 2.0);
	// Add an ellipse circumscribed in the given rect to the current path, then stroke it
	CGContextAddEllipseInRect(context, CGRectMake(self.x1, self.y1, self.dotSize.width, self.dotSize.height));
    
    CGContextAddEllipseInRect(context, CGRectMake(self.x2, self.y2, self.dotSize.width, self.dotSize.height));

	CGContextFillPath(context);
}


@end
