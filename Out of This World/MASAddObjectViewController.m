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
    
    /// Setting Background of VC to a pattern of an image
    UIImage *orionImage = [UIImage imageNamed:@"Orion.jpg"];
    ///self.view is referring to the view of the VC that VC controls
    self.view.backgroundColor = [UIColor colorWithPatternImage:orionImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButton:(UIButton *)sender {
}

- (IBAction)addButton:(UIButton *)sender {
}
@end
