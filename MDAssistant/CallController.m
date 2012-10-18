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
@synthesize callLabel = _callLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    // Do any additional setup after loading the view from its nib.
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setCallLabel:nil];
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
    NSString *loadString = [defaults objectForKey:@"callNum"];
    NSString *callString = [NSString stringWithFormat:@"tel:%@", loadString];
    NSLog(@"%@", loadString);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callString]];
}

@end
