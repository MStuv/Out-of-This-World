//
//  MASAddObjectViewController.h
//  Out of This World
//
//  Created by Mark Stuver on 10/30/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MASAddObjectViewController : UIViewController


/// Properties
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UITextField *diameterTextField;
@property (strong, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberOfMoonsTextField;
@property (strong, nonatomic) IBOutlet UITextField *interestingFactTextField;

///Buttons
- (IBAction)cancelButton:(UIButton *)sender;
- (IBAction)addButton:(UIButton *)sender;




@end
