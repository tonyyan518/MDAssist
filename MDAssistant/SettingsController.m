//
//  SecondViewController.m
//  MDAssistant
//
//  Created by Tony Yan
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
    
    //set the key pads for number-only inputs to number pads
    self.uniqueIDText.keyboardType = UIKeyboardTypeNumberPad;
    self.cellNumberText.keyboardType = UIKeyboardTypeNumberPad;
    self.pagerNumberText.keyboardType = UIKeyboardTypeNumberPad;
    
    //enable tapping background to dismiss key pad
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTouched)];
    [self.inputScroll addGestureRecognizer:gestureRecognizer];
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
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (UIInterfaceOrientationIsPortrait(interfaceOrientation));
}

- (void)backgroundTouched {
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
    //check if the input matches expectations
    if ([savedID length ] != 7) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Unique ID must be 7 digits." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([savedCell length ] != 10) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Cell # must be 10 digits." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([savedPager length ] != 10) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Pager # must be 10 digits." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    //store the user's settings
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
