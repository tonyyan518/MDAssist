//
//  CallController.m
//  MDAssistant
//
//  Created by guest user on 10/9/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import "CallController.h"

@interface CallController ()

@end

@implementation CallController
@synthesize message, rowNumber;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)updateRowNumber:(int)theindex {
    rowNumber = theindex + 1;
    message.text = [NSString stringWithFormat:@"row %i was clicked", rowNumber];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    message.text = [NSString stringWithFormat:@"row %i was clicked", rowNumber];
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
