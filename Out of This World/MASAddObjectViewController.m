//
//  MASAddObjectViewController.m
//  Out of This World
//
//  Created by Mark Stuver on 10/30/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import "MASAddObjectViewController.h"

@interface MASAddObjectViewController ()

@end

@implementation MASAddObjectViewController

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
	// Do any additional setup after loading the view.
    
    // Setting Background of VC to a pattern of an image
    UIImage *orionImage = [UIImage imageNamed:@"Orion.jpg"];
    //self.view is referring to the view of the VC that VC controls
    self.view.backgroundColor = [UIColor colorWithPatternImage:orionImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButton:(UIButton *)sender {
    
    // access the delegate property and
    [self.delegate didCancel];
}

- (IBAction)addButton:(UIButton *)sender {
    
    // Create instance of spaceObject setting it to the SpaceObject that is returned from the returnNewSpaceObject helper method.
    MASSpaceObject *newSpaceObject = [self returnNewSpaceObject];
    [self.delegate addSpaceObject:newSpaceObject];
}

#pragma mark - Helper Methods

// Method will be called
-(MASSpaceObject *)returnNewSpaceObject
{
    MASSpaceObject *addedSpaceObject = [[MASSpaceObject alloc] init];
    addedSpaceObject.name = self.nameTextField.text;
    addedSpaceObject.nickname = self.nicknameTextField.text;
    addedSpaceObject.diameter = [self.diameterTextField.text floatValue];
    addedSpaceObject.temperature = [self.temperatureTextField.text floatValue];
    addedSpaceObject.numberOfMoons = [self.numberOfMoonsTextField.text intValue];
    addedSpaceObject.interestFact = self.interestingFactTextField.text;
    
    // Add placeholder for planet image
    addedSpaceObject.spaceImage = [UIImage imageNamed:@"EinsteinRing.jpg"];
    
    return addedSpaceObject;
}
@end
