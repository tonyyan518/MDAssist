//
//  PDFViewController.m
//  MDAssistant
//
//  Created by guest user on 10/7/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import "PDFViewController.h"

@interface PDFViewController ()

@end

@implementation PDFViewController

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
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Resident Handbook" ofType:@"pdf"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [pdfView loadRequest:request];
    [pdfView setScalesPageToFit:YES];

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
