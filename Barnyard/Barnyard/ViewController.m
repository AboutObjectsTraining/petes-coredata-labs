//
//  ViewController.m
//  Barnyard
//
//  Created by Peter Victoratos on 3/6/20.
//  Copyright © 2020 AO. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
{
    AVAudioPlayer *_audioPlayer;
    NSURL *_soundURL;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)goatSpeak {
    NSString *goatSoundPath = [NSString stringWithFormat:@"%@/goat.wav", [[NSBundle mainBundle] resourcePath]];
    _soundURL = [NSURL fileURLWithPath:goatSoundPath];
    
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:_soundURL error:nil];
    [_audioPlayer play];
}

- (IBAction)roosterSpeak {
    NSString *roosterSoundPath = [NSString stringWithFormat:@"%@/rooster.wav", [[NSBundle mainBundle] resourcePath]];
    _soundURL = [NSURL fileURLWithPath:roosterSoundPath];
    
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:_soundURL error:nil];
    [_audioPlayer play];
    
}

- (IBAction)pigSpeak {
    NSString *pigSoundPath = [NSString stringWithFormat:@"%@/pig.wav", [[NSBundle mainBundle] resourcePath]];
    _soundURL = [NSURL fileURLWithPath:pigSoundPath];
    
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:_soundURL error:nil];
    [_audioPlayer play];
}


@end
