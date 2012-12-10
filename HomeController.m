//
//  HomeController.m
//  MDAssistant
//
//  Created by Tony Yan
//

#import "HomeController.h"

#define PAGER_SEGUE @"pagerSegue"
#define CONTACT_SEGUE @"contactSegue"
#define CALL_SEGUE @"callSegue"
#define DICTATION_SEGUE @"dictationSegue"
#define HANDBOOK_SEGUE @"handbookSegue"

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
    securityKey = @"test";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)pagerButtonPressed:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *uniqueID = [defaults objectForKey:@"savedID"];
    NSString *pagerNum = [defaults objectForKey:@"savedPager"];
    NSString *cellNum = [defaults objectForKey:@"savedCell"];
    NSString *securityCode = [defaults objectForKey:@"securityCode"];
    if ([securityCode isEqual:securityKey]) {
        if(uniqueID != NULL && pagerNum != NULL && cellNum != NULL) {
            [self performSegueWithIdentifier:PAGER_SEGUE sender:self];
        }
        else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please fill out Settings before using the Pager Assistant." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Incorrect Security Code. Please check Settings." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)contactButtonPressed:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *securityCode = [defaults objectForKey:@"securityCode"];
    if ([securityCode isEqual:securityKey]) {
        [self performSegueWithIdentifier:CONTACT_SEGUE sender:self];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Incorrect Security Code. Please check Settings." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)dictationButtonPressed:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *securityCode = [defaults objectForKey:@"securityCode"];
    if ([securityCode isEqual:securityKey]) {
        [self performSegueWithIdentifier:DICTATION_SEGUE sender:self];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Incorrect Security Code. Please check Settings." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)handbookButtonPressed:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *securityCode = [defaults objectForKey:@"securityCode"];
    if ([securityCode isEqual:securityKey]) {
        [self performSegueWithIdentifier:HANDBOOK_SEGUE sender:self];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Incorrect Security Code. Please check Settings." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)callButtonPressed:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *securityCode = [defaults objectForKey:@"securityCode"];
    if ([securityCode isEqual:securityKey]) {
        [self performSegueWithIdentifier:CALL_SEGUE sender:self];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Incorrect Security Code. Please check Settings." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)openHandbook:(id)sender {
    NSString *fileName = @"Resident Handbook Final3";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:fileName forKey:@"fileName"];
}

@end
