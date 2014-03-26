//
//  ViewController.h
//  protect6
//
//  Created by 林小露 on 14-3-21.
//  Copyright (c) 2014年 林小露. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "AnimateViewController.h"
@interface ViewController : UIViewController<UIAlertViewDelegate>

- (IBAction)alert:(id)sender;
- (IBAction)sendEmail:(id)sender;
- (IBAction)postToFaceBook:(id)sender;


@end
