//
//  CallController.h
//  MDAssistant
//
//  Created by guest user on 10/9/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CallController : UIViewController {
    int rowNumber;
    IBOutlet UILabel *message;
}

@property(readwrite) int rowNumber;
@property(nonatomic, retain) IBOutlet UILabel *message;
-(void)updateRowNumber:(int)theindex;
@end
