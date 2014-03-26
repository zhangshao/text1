//
//  AnimateViewController.m
//  protect6
//
//  Created by 林小露 on 14-3-23.
//  Copyright (c) 2014年 林小露. All rights reserved.
//

#import "AnimateViewController.h"

@interface AnimateViewController ()

@end

@implementation AnimateViewController

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
    NSArray *imageNames = @[@"niaoshu1.png",@"niaoshu2.png",@"niaoshu3.png",@"niaoshu4.png",@"niaoshu5.png",@"niaoshu6.png",@"niaoshu7.png",@"niaoshu8.png",@"niaoshu9.png",@"niaoshu10.png",@"niaoshu11.png",@"niaoshu12.png",@"niaoshu13.png",@"niaoshu14.png",@"niaoshu15.png"];
    NSMutableArray *images = [[NSMutableArray alloc]init];
    for (int i = 0; i<imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
        
    }
    
    UIImageView *animationImageView = [[UIImageView alloc]initWithFrame:CGRectMake(60, 195, 86, 193)];
    animationImageView.animationImages =images;
    animationImageView.animationDuration = 0.5;
    [self.view addSubview:animationImageView];
    [animationImageView startAnimating];
    UIImageView *slowAnimationImageView = [[UIImageView alloc]initWithFrame:CGRectMake(160, 195, 86, 193)];
    slowAnimationImageView.animationImages =images;
    slowAnimationImageView.animationDuration = 3;
    [self.view addSubview:slowAnimationImageView];
    [slowAnimationImageView startAnimating];
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(20, 120, 60, 40)];
    [button setTitle:@"Play" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [super viewDidLoad];
	UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setFrame:CGRectMake(80, 120, 60, 40)];
    [button1 setTitle:@"Pause" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    [super viewDidLoad];
	UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setFrame:CGRectMake(140, 120, 60, 40)];
    [button2 setTitle:@"Stop" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];    // Do any additional setup after loading the view, typically from a nib.
    NSString *string = [[NSBundle mainBundle]pathForResource:@"江南Style"ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:string];
    avAudioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    avAudioPlayer.delegate = self;
    avAudioPlayer.numberOfLoops = -1;
    [avAudioPlayer prepareToPlay];
    progressV = [[UIProgressView alloc] initWithFrame:CGRectMake(20, 70, 200, 20)];
    [self.view addSubview:progressV];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(playProgress) userInfo:nil repeats:YES];
    volumeSlider = [[UISlider alloc]initWithFrame:CGRectMake(20, 100, 200, 20)];
    [volumeSlider addTarget:self action:@selector(volumeChange) forControlEvents:UIControlEventValueChanged];
    volumeSlider.minimumValue = 0.0f;
    volumeSlider.maximumValue = 10.0f;
    volumeSlider.value = 5.0f;
    [self.view addSubview:volumeSlider];
    UISwitch *swith = [[UISwitch alloc]initWithFrame:CGRectMake(100, 150, 60, 40)];
    swith.on = YES;
    [self.view addSubview:swith];}
-(void)play{
    [avAudioPlayer play];
    
}
-(void)pause{
    [avAudioPlayer pause];
}
-(void)stop{
    avAudioPlayer.currentTime = 0;
    [avAudioPlayer stop];
    
}
-(void)playProgress{
    progressV.progress = avAudioPlayer.currentTime/avAudioPlayer.duration;
}
-(void)onOrOff:(UISwitch *)sender
{
    avAudioPlayer.volume = sender.on;
}
-(void)volumeChange
{
    avAudioPlayer.volume = volumeSlider.value;
}
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    [timer invalidate];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
