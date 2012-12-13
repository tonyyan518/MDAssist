//
//  HomeController.m
//  MDAssistant
//
//  Created by Tony Yan
//
//  This is the Home page of the App
//

#import "HomeController.h"

#define PAGER_SEGUE @"pagerSegue"
#define CONTACT_SEGUE @"contactSegue"
#define CALL_SEGUE @"callSegue"
#define DICTATION_SEGUE @"dictationSegue"
#define HANDBOOK_SEGUE @"handbookSegue"
#define CALCULATOR_SEGUE @"calculatorSegue"

@interface HomeController ()

@end

@implementation HomeController {
    NSString *securityKey;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //set the Security Key for the app here
    securityKey = @"test";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (UIInterfaceOrientationIsPortrait(interfaceOrientation));
}

- (IBAction)pagerButtonPressed:(id)sender
{
    //Pager function is only enabled when Settings is correctly filled out
    if ([self checkSecurityCode]) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *uniqueID = [defaults objectForKey:@"savedID"];
        NSString *pagerNum = [defaults objectForKey:@"savedPager"];
        NSString *cellNum = [defaults objectForKey:@"savedCell"];
        
        if(uniqueID != NULL && pagerNum != NULL && cellNum != NULL) {
            [self performSegueWithIdentifier:PAGER_SEGUE sender:self];
        }
         else {
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please fill out Settings before using the Pager Assistant." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
             [alert show];
         }
    }
}

- (IBAction)contactButtonPressed:(id)sender
{
    if ([self checkSecurityCode]) {
        [self performSegueWithIdentifier:CONTACT_SEGUE sender:self];
    }
}

- (IBAction)dictationButtonPressed:(id)sender
{
    if ([self checkSecurityCode]) {
        [self performSegueWithIdentifier:DICTATION_SEGUE sender:self];
    }
}

- (IBAction)handbookButtonPressed:(id)sender
{
    if ([self checkSecurityCode]) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *fileName = @"Resident Handbook Final3";
        [defaults setObject:fileName forKey:@"fileName"];
        [self performSegueWithIdentifier:HANDBOOK_SEGUE sender:self];
    }        
    
}

- (IBAction)callButtonPressed:(id)sender
{
    if ([self checkSecurityCode]) {
        [self performSegueWithIdentifier:CALL_SEGUE sender:self];
    }
}

- (IBAction)calculatorButtonPress:(id)sender {
    if ([self checkSecurityCode]) {
        [self performSegueWithIdentifier:CALCULATOR_SEGUE sender:self];
    }
}

- (BOOL) checkSecurityCode {
    //check if the Security Code in Settings matches the Security Key of the app
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *securityCode = [defaults objectForKey:@"securityCode"];
    if ([securityCode isEqual:securityKey]) {
        return YES;
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Incorrect Security Code. Please check Settings." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
}

@end
