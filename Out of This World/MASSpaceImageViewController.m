//
//  MASSpaceImageViewController.m
//  Out of This World
//
//  Created by Mark Stuver on 10/23/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import "MASSpaceImageViewController.h"

@interface MASSpaceImageViewController ()

@end

@implementation MASSpaceImageViewController

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
    
    /// initalize the imageView property with the spaceImage property that was passed through the prepareForSegue method.
    self.imageView = [[UIImageView alloc] initWithImage:self.spaceObject.spaceImage];
    
    ///Set the contentSize of the scrollView to equal the frame size of the imageView
    self.scrollView.contentSize = self.imageView.frame.size;
    
    ///Set the imageView on top of the scrollView
    [self.scrollView addSubview:self.imageView];
    
    ///Set the scrollView as the delegate to listen for the delegate methods
    self.scrollView.delegate =self;
    
    ///Condition of the ScrollViewDelegate is to set the min and max of the zoom
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.minimumZoomScale = 0.5;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/// UIScrollViewDelegate
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    /// which view should we zoom into
    return self.imageView;
}

@end
