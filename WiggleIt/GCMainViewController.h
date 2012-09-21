//
//  GCMainViewController.h
//  WiggleIt
//
//  Created by Johannes Drever on 9/6/12.
//  Copyright (c) 2012 Johannes Drever. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GCParameterSet.h"

@interface GCMainViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UISwitch *humanInteractionSwitch;
@property (weak, nonatomic) IBOutlet UISlider *gammaSlider;
@property (weak, nonatomic) IBOutlet UISlider *alphaSlider;
@property (weak, nonatomic) IBOutlet UISlider *omegaSlider;
@property (weak, nonatomic) IBOutlet UISwitch *muSwitch;
@property (weak, nonatomic) IBOutlet UISlider *aSlider;
@property (weak, nonatomic) IBOutlet UISlider *bSlider;
@property (weak, nonatomic) IBOutlet UISlider *betaSlider;

@property (weak, nonatomic) IBOutlet UILabel *betaLabel;
@property (weak, nonatomic) IBOutlet UILabel *gammaLabel;
@property (weak, nonatomic) IBOutlet UILabel *alphaLabel;
@property (weak, nonatomic) IBOutlet UILabel *omegaLabel;
@property (weak, nonatomic) IBOutlet UILabel *muLabel;
@property (weak, nonatomic) IBOutlet UILabel *aLabel;
@property (weak, nonatomic) IBOutlet UILabel *bLabel;
@property GCParameterSet *parameterSet;
@end
