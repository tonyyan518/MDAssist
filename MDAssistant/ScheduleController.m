//
//  ScheduleController.m
//  MDAssistant
//
//  Created by Tony Yan
//

#import "ScheduleController.h"

@interface ScheduleController ()

@end

@implementation ScheduleController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //hard-coded URl of the call schedule for this version
    NSString *fullURL = @"https://docs.google.com/spreadsheet/pub?key=0AqQXin61uUcidGRjY1QyOG52RGR4VG45UnZVTmtZN2c&single=true&gid=2&output=html";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [scheduleView loadRequest:request];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
