//
//  MASAddObjectViewController.h
//  Out of This World
//
//  Created by Mark Stuver on 10/30/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MASSpaceObject.h"


/// Creating our own protocol to send data back to previous VC
@protocol MASAddSpaceViewControllerDelegate <NSObject>

///Methods will be called/implemented in a VC that had conformed to this @protocol

/// required means that if a VC conforms to the @protocol/delegate, it is required to implement the @required methods. @optional would mean that it would be @optional to implement.

@required

/// adjusted method so that it will pass a spaceObject to the conforming VC
-(void)addSpaceObject:(MASSpaceObject *)spaceObject;
-(void)didCancel;

@end

@interface MASAddObjectViewController : UIViewController

/** This property will be available to be set in the conformed VC.**/
@property (weak, nonatomic) id <MASAddSpaceViewControllerDelegate> delegate;


// Properties
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UITextField *diameterTextField;
@property (strong, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberOfMoonsTextField;
@property (strong, nonatomic) IBOutlet UITextField *interestingFactTextField;

//Buttons
- (IBAction)cancelButton:(UIButton *)sender;
- (IBAction)addButton:(UIButton *)sender;




@end
