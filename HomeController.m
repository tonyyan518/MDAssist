//
//  HomeController.m
//  MDAssistant
//
//  Created by guest user on 10/18/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import "HomeController.h"

#define PAGER_SEGUE @"pagerSegue"

@interface HomeController ()

@end

@implementation HomeController

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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
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
    if(uniqueID != NULL && pagerNum != NULL && cellNum != NULL) {
        [self performSegueWithIdentifier:PAGER_SEGUE sender:self];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please fill out Settings before using the Pager Assistant" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];    }
}

- (IBAction)openHandbook:(id)sender {
    NSString *fileName = @"Resident Handbook Final3";
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:fileName forKey:@"fileName"];
}

- (IBAction)openDictation:(id)sender {
    NSString *fileName = @"Dictation Templates";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:fileName forKey:@"fileName"];
}

@end
