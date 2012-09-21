//
//  GCMainViewController.m
//  WiggleIt
//
//  Created by Johannes Drever on 9/6/12.
//  Copyright (c) 2012 Johannes Drever. All rights reserved.
//

#import "GCMainViewController.h"
#import "GCFingerViewController.h"

@interface GCMainViewController ()

@end

@implementation GCMainViewController
@synthesize humanInteractionSwitch;
@synthesize gammaSlider;
@synthesize alphaSlider;
@synthesize omegaSlider;
@synthesize muSwitch;
@synthesize aSlider;
@synthesize bSlider;
@synthesize betaSlider;
@synthesize betaLabel;
@synthesize gammaLabel;
@synthesize alphaLabel;
@synthesize omegaLabel;
@synthesize muLabel;
@synthesize aLabel;
@synthesize bLabel;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.parameterSet = [[GCParameterSet alloc] init];
    self.omegaLabel.text = [NSString stringWithFormat:@"%5.2f", self.parameterSet.omega];
    self.alphaLabel.text = [NSString stringWithFormat:@"%5.2f", self.parameterSet.alpha];
    self.muLabel.text = [NSString stringWithFormat:@"%5.2f", self.parameterSet.mu];
    self.gammaLabel.text = [NSString stringWithFormat:@"%5.2f", self.parameterSet.gamma];
    self.aLabel.text = [NSString stringWithFormat:@"%5.2f", self.parameterSet.A];
    self.bLabel.text = [NSString stringWithFormat:@"%5.2f", self.parameterSet.B];
    self.betaLabel.text = [NSString stringWithFormat:@"%5.2f", self.parameterSet.beta];
    
    [self.omegaSlider setValue:self.parameterSet.omega];
    [self.gammaSlider setValue:self.parameterSet.gamma];
    [self.aSlider setValue:self.parameterSet.A];
    [self.bSlider setValue:self.parameterSet.B];
    [self.alphaSlider setValue:self.parameterSet.alpha];
    [self.betaSlider setValue:self.parameterSet.beta];
    if(self.parameterSet.mu == 1){
        [self.muSwitch setOn:YES];
    }else{
        [self.muSwitch setOn:NO];
    }
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}
- (void)viewDidUnload
{
    [self setGammaSlider:nil];
    [self setAlphaSlider:nil];
    [self setOmegaSlider:nil];
    [self setMuSwitch:nil];
    [self setASlider:nil];
    [self setBSlider:nil];
    [self setGammaLabel:nil];
    [self setAlphaLabel:nil];
    [self setOmegaLabel:nil];
    [self setMuLabel:nil];
    [self setALabel:nil];
    [self setBLabel:nil];
    [self setAlphaSlider:nil];
    [self setBetaSlider:nil];
    [self setBetaLabel:nil];
    [self setHumanInteractionSwitch:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if([indexPath isEqual:[NSIndexPath indexPathForRow:0 inSection:0]]){
        GCFingerViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"wiggleView"];
        controller.parameterSet = self.parameterSet;
        controller.humanInteraction = !self.humanInteractionSwitch.isOn;
        [self presentModalViewController:controller animated:YES];
    }
}

#pragma mark - Callbacks
- (IBAction)gammaMoved:(id)sender {
    UISlider *slider = (UISlider *) sender;
    self.parameterSet.gamma = slider.value;
    self.gammaLabel.text = [NSString stringWithFormat:@"%5.2f", self.parameterSet.gamma];
}
- (IBAction)alphaChanged:(id)sender {
    UISlider *slider = (UISlider *) sender;
    self.parameterSet.alpha = slider.value;
    self.alphaLabel.text = [NSString stringWithFormat:@"%5.2f", self.parameterSet.alpha];
}
- (IBAction)omegaChanged:(id)sender {
    UISlider *slider = (UISlider *) sender;
    self.parameterSet.omega = slider.value;
    self.omegaLabel.text = [NSString stringWithFormat:@"%5.2f", self.parameterSet.omega];
}
- (IBAction)muChanged:(id)sender {
    UISwitch *s = (UISwitch *) sender;
    if(s.isOn){
        self.parameterSet.mu = 1.0;
    }else{
        self.parameterSet.mu = -1.0;
    }

    self.muLabel.text = [NSString stringWithFormat:@"%5.2f", self.parameterSet.mu];
}
- (IBAction)aChanged:(id)sender {
    UISlider *slider = (UISlider *) sender;
    self.parameterSet.A = slider.value;
    self.aLabel.text = [NSString stringWithFormat:@"%5.2f", self.parameterSet.A];
}
- (IBAction)bChanged:(id)sender {
    UISlider *slider = (UISlider *) sender;
    self.parameterSet.B = slider.value;
    self.bLabel.text = [NSString stringWithFormat:@"%5.2f", self.parameterSet.B];
}
- (IBAction)betaChanged:(id)sender {
    UISlider *slider = (UISlider *) sender;
    self.parameterSet.beta = slider.value;
    self.bLabel.text = [NSString stringWithFormat:@"%5.2f", self.parameterSet.beta];
}

@end
