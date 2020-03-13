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
@property AVAudioPlayer *audioPlayer;
@property NSURL *soundURL;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)goatSpeak {
    NSString *goatSoundPath = [NSString stringWithFormat:@"%@/goat.wav", [[NSBundle mainBundle] resourcePath]];
    self.soundURL = [NSURL fileURLWithPath:goatSoundPath];
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.soundURL error:nil];
    [self.audioPlayer play];
}

- (IBAction)roosterSpeak {
    NSString *roosterSoundPath = [NSString stringWithFormat:@"%@/rooster.wav", [[NSBundle mainBundle] resourcePath]];
    self.soundURL = [NSURL fileURLWithPath:roosterSoundPath];
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.soundURL error:nil];
    [self.audioPlayer play];
    
}

- (IBAction)pigSpeak {
    NSString *pigSoundPath = [NSString stringWithFormat:@"%@/pig.wav", [[NSBundle mainBundle] resourcePath]];
    self.soundURL = [NSURL fileURLWithPath:pigSoundPath];
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.soundURL error:nil];
    [self.audioPlayer play];
}


@end
