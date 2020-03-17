//
//  ViewController.m
//  Barnyard
//
//  Created by Peter Victoratos on 3/6/20.
//  Copyright © 2020 AO. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "CoolViewCell.h"

@interface ViewController () <UITextFieldDelegate>
@property AVAudioPlayer *audioPlayer;
@property NSURL *soundURL;
@property (strong, nonatomic) IBOutletCollection(NSMutableArray) NSMutableArray *cells;
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
    [self addCell:@"*bleats*"];

}

- (IBAction)roosterSpeak {
    NSString *roosterSoundPath = [NSString stringWithFormat:@"%@/rooster.wav", [[NSBundle mainBundle] resourcePath]];
    self.soundURL = [NSURL fileURLWithPath:roosterSoundPath];
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.soundURL error:nil];
    [self.audioPlayer play];
    [self addCell:@"Cluck"];

    
}

- (IBAction)pigSpeak {
    NSString *pigSoundPath = [NSString stringWithFormat:@"%@/pig.wav", [[NSBundle mainBundle] resourcePath]];
    self.soundURL = [NSURL fileURLWithPath:pigSoundPath];
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.soundURL error:nil];
    [self.audioPlayer play];
    [self addCell:@"Oink"];
}

- (NSMutableArray *)cells {
    if (_cells == nil) {
        _cells = [[NSMutableArray alloc] init];
    }
    return _cells;
}

- (void)addCell:(NSString *)animalSound {
    CoolViewCell *cell = [[CoolViewCell alloc] init];
    cell.backgroundColor = [cell randomColor];
    cell.clipsToBounds = YES;
    cell.text = animalSound;
    [self.cells addObject:cell];
    [self.view addSubview:cell];
}

@end
