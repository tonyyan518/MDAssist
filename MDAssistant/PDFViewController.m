//
//  PDFViewController.m
//  MDAssistant
//
//  Created by Tony Yan
//

#import "PDFViewController.h"

@interface PDFViewController ()

@end

@implementation PDFViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (IBAction)topButtonPressed:(id)sender {
    //return to the top page by reloading the document
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadString = [defaults objectForKey:@"fileName"];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:loadString ofType:@"pdf"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [pdfView loadRequest:request];
    [pdfView setScalesPageToFit:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// load the document that is supposed to be displayed
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadString = [defaults objectForKey:@"fileName"];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:loadString ofType:@"pdf"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [pdfView loadRequest:request];
    [pdfView setScalesPageToFit:YES];

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
