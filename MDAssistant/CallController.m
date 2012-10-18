//
//  CallController.m
//  MDAssistant
//
//  Created by guest user on 10/17/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import "CallController.h"

@interface CallController ()

@end

@implementation CallController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}   

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)callPhone:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *pagerNum = [defaults objectForKey:@"savedPager"];
    NSString *uniqueID = [defaults objectForKey:@"savedID"];
    NSString *backOnPage = [NSString stringWithFormat:@"te   l:919970%@,,*#,%@,12", pagerNum, uniqueID];
    NSLog(backOnPage);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:backOnPage]];
}

@end
