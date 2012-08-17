//
//  GCDetailViewController.h
//  WiggleIt
//
//  Created by Johannes Drever on 8/17/12.
//  Copyright (c) 2012 Johannes Drever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
