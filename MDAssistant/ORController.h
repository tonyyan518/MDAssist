//
//  CallController.h
//  MDAssistant
//
//  Created by guest user on 10/9/12.
//  Copyright (c) 2012 guest user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ORController : UIViewController {
    int rowNumber;
    IBOutlet UILabel *message;
}

@property(readwrite) int rowNumber;
@property(nonatomic, retain) IBOutlet UILabel *message;
@end
