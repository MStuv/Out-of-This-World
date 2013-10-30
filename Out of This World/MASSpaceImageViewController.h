//
//  MASSpaceImageViewController.h
//  Out of This World
//
//  Created by Mark Stuver on 10/23/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MASSpaceObject.h"

/// Add UIScrollViewDelegate
@interface MASSpaceImageViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic)UIImageView *imageView;

/// Object that will be passed the object data from the MASOuterSpaceTableViewController through the prepareForSegue method.
@property (strong, nonatomic) MASSpaceObject *spaceObject;

@end
