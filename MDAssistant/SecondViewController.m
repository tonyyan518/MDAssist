//
//  SecondViewController.m
//  MDAssistant
//
//  Created by guest user on 9/17/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () <UITextFieldDelegate>

@end

@implementation SecondViewController
@synthesize nameText = _nameText;
@synthesize uniqueIDText = _uniqueIDText;
@synthesize cellNumberText = _cellNumberText;
@synthesize pagerNumberText = _pagerNumberText;
@synthesize emailText = _emailText;
@synthesize inputScroll = _inputScroll;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
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
    [[self nameText] setDelegate:self];
    [[self uniqueIDText] setDelegate:self];
    [[self cellNumberText] setDelegate:self];
    [[self pagerNumberText] setDelegate:self];
    [[self emailText] setDelegate:self];
}

- (void)viewDidUnload
{
    [self setNameText:nil];
    [self setUniqueIDText:nil];
    [self setCellNumberText:nil];
    [self setPagerNumberText:nil];
    [self setEmailText:nil];
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
}

- (IBAction)textfieldReturn:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)saveData:(id)sender {
    NSString *savedName = self.nameText.text;
    NSString *savedID = self.uniqueIDText.text;
    NSString *savedCell = self.cellNumberText.text;
    NSString *savedPager = self.pagerNumberText.text;
    NSString *savedEmail = self.emailText.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:savedName forKey:@"savedName"];
    [defaults setObject:savedID forKey:@"savedID"];
    [defaults setObject:savedCell forKey:@"savedCell"];
    [defaults setObject:savedPager forKey:@"savedPager"];
    [defaults setObject:savedEmail forKey:@"savedEmail"];
    [defaults synchronize];
    
    [self.navigationController popViewControllerAnimated:YES];
};

- (IBAction)loadData:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadString = [defaults objectForKey:@"savedName"];
    [self.nameText setText:loadString];
};

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    float xOrigin = 0;
    float yOrigin = [textField frame].origin.y;
    CGPoint offset = CGPointMake(xOrigin, yOrigin);
    [self.inputScroll setContentOffset:offset animated:YES];
}

- (void) textfieldReturn:(id)sender:(UITextField *)textField {
    CGPoint offset = CGPointMake(0, 0);
    [self.inputScroll setContentOffset:offset animated:YES];
}

-(NSString*) saveFilePath{
    NSString* path = [NSString stringWithFormat:@"%@%@",
                      [[NSBundle mainBundle] resourcePath],
                      @"settings.plist"];
    return path;}

@end
