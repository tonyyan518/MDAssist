//
//  SecondViewController.m
//  MDAssistant
//
//  Created by guest user on 9/17/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import "SettingsController.h"

@interface SettingsController () <UITextFieldDelegate>

@end

@implementation SettingsController
@synthesize nameText = _nameText;
@synthesize uniqueIDText = _uniqueIDText;
@synthesize cellNumberText = _cellNumberText;
@synthesize pagerNumberText = _pagerNumberText;
@synthesize emailText = _emailText;
@synthesize securityText = _securityText;
@synthesize inputScroll = _inputScroll;

- (void)viewDidLoad
{
    //[super viewDidLoad];
    
    //enable scrolling
    [self.inputScroll setScrollEnabled:YES];
    [self.inputScroll setContentSize:CGSizeMake(320,1000)];
    
    
    //load the previous settings
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadString = [defaults objectForKey:@"savedName"];
    [self.nameText setText:loadString];
    loadString = [defaults objectForKey:@"savedID"];
    [self.uniqueIDText setText:loadString];
    loadString = [defaults objectForKey:@"savedCell"];
    [self.cellNumberText setText:loadString];
    loadString = [defaults objectForKey:@"savedPager"];
    [self.pagerNumberText setText:loadString];
    loadString = [defaults objectForKey:@"savedEmail"];
    [self.emailText setText:loadString];
    loadString = [defaults objectForKey:@"securityCode"];
    [self.securityText setText:loadString];
    [[self nameText] setDelegate:self];
    [[self uniqueIDText] setDelegate:self];
    [[self cellNumberText] setDelegate:self];
    [[self pagerNumberText] setDelegate:self];
    [[self emailText] setDelegate:self];
    [[self securityText] setDelegate:self];
}

- (void)viewDidUnload
{
    [self setNameText:nil];
    [self setUniqueIDText:nil];
    [self setCellNumberText:nil];
    [self setPagerNumberText:nil];
    [self setEmailText:nil];
    [self setSecurityText:nil];
    [self setInputScroll:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)backgroundTouched:(id)sender {
    [self.nameText resignFirstResponder];
    [self.uniqueIDText resignFirstResponder];
    [self.cellNumberText resignFirstResponder];
    [self.pagerNumberText resignFirstResponder];
    [self.emailText resignFirstResponder];
    [self.securityText resignFirstResponder];
}

- (IBAction)textfieldReturn:(id)sender {
    [sender resignFirstResponder];
    CGPoint offset = CGPointMake(0, 0);
    [self.inputScroll setContentOffset:offset animated:YES];
}

- (IBAction)saveData:(id)sender {
    NSString *savedName = self.nameText.text;
    NSString *savedID = self.uniqueIDText.text;
    NSString *savedCell = self.cellNumberText.text;
    NSString *savedPager = self.pagerNumberText.text;
    NSString *savedEmail = self.emailText.text;
    NSString *securityCode = self.securityText.text;
    if ([savedID length ] != 7) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Unique ID must be 7 digits" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([savedCell length ] != 10) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Cell # must be 10 digits with no symbols" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([savedPager length ] != 10) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Pager # must be 10 digits with no symbols" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:savedName forKey:@"savedName"];
        [defaults setObject:savedID forKey:@"savedID"];
        [defaults setObject:savedCell forKey:@"savedCell"];
        [defaults setObject:savedPager forKey:@"savedPager"];
        [defaults setObject:savedEmail forKey:@"savedEmail"];
        [defaults setObject:securityCode forKey:@"securityCode"];
        [defaults synchronize];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
};

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    float xOrigin = 0;
    float yOrigin = [textField frame].origin.y - 50;
    if (yOrigin < 0) yOrigin = 0;
    CGPoint offset = CGPointMake(xOrigin, yOrigin);
    [self.inputScroll setContentOffset:offset animated:YES];
}

- (NSString*) saveFilePath{
    NSString* path = [NSString stringWithFormat:@"%@%@",
                      [[NSBundle mainBundle] resourcePath],
                      @"settings.plist"];
    return path;
}

@end
