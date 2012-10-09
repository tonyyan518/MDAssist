//
//  ScheduleController.m
//  MDAssistant
//
//  Created by guest user on 10/9/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import "ScheduleController.h"

@interface ScheduleController ()

@end

@implementation ScheduleController

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
    NSString *fullURL = @"https://docs.google.com/spreadsheet/pub?key=0AqQXin61uUcidGRjY1QyOG52RGR4VG45UnZVTmtZN2c&single=true&gid=2&output=html";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [scheduleView loadRequest:request];
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

@end
