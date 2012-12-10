//
//  SecondViewController.h
//  MDAssistant
//
//  Created by guest user on 9/17/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *uniqueIDText;
@property (weak, nonatomic) IBOutlet UITextField *cellNumberText;
@property (weak, nonatomic) IBOutlet UITextField *pagerNumberText;
@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UITextField *securityText;
@property (weak, nonatomic) IBOutlet UIScrollView *inputScroll;

- (IBAction)backgroundTouched:(id)sender;
- (IBAction)textfieldReturn:(id)sender;
- (IBAction)saveData:(id)sender;
- (IBAction)loadData:(id)sender;

@end
