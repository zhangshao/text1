//
//  ViewController.m
//  protect6
//
//  Created by 林小露 on 14-3-21.
//  Copyright (c) 2014年 林小露. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)alert:(id)sender {
   
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Wlecome!" message:@"click on it" delegate:self cancelButtonTitle:@"google" otherButtonTitles:@"baidu", nil];
    [alertView show];
    

}

- (IBAction)sendEmail:(id)sender {
    NSString *emailTitle = @"Zhangshao Email";
    NSString *emailContent = @"Zhangshao shi shabi";
    NSArray *address = [NSArray arrayWithObject:@"526417119@qq.com"];
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc]init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:emailContent isHTML:YES];
    [mc setToRecipients:address];
    [self presentViewController:mc animated:YES completion:NULL];
}

- (IBAction)postToFaceBook:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *faceBook = [[SLComposeViewController alloc]init];
        faceBook = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [faceBook setInitialText:[NSString stringWithFormat:@"XCode is cool!"]];
        [faceBook addURL:[NSURL URLWithString:@"http://www.geekhead.org"]];
        [self presentViewController:faceBook animated:YES completion:nil];
        [faceBook setCompletionHandler:^(SLComposeViewControllerResult result){
            NSString *output;
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                output = @"Action cancelled";
                    NSLog(@"Action cancelled");
                    break;
                case SLComposeViewControllerResultDone:
                    output = @"Posted";
                    NSLog(@"Posted");
                    break;
    
                    
                default:
                    break;
            }
        }];
        
        
    }
}


-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"Mail sent!");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail Failed!");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail Saved!");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"Mail Cancelled!");
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.google.com"]];
    }
    if (buttonIndex ==1) {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.baidu.com"]];
        
    }

        
        
    }

@end
