//
//  AnimateViewController.h
//  protect6
//
//  Created by 林小露 on 14-3-23.
//  Copyright (c) 2014年 林小露. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface AnimateViewController : UIViewController<AVAudioPlayerDelegate>
{
    AVAudioPlayer *avAudioPlayer;
    UIProgressView *progressV;
    UISlider *volumeSlider;
    NSTimer *timer;
    
    
    
}
@end
