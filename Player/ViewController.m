//
//  ViewController.m
//  Player
//
//  Created by HEYMES Lucas on 25/10/12.
//  Copyright (c) 2012 Heymès Lucas. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()
{
    SystemSoundID shortSoundID;
    AVAudioPlayer *audioPlayer;
    MPMoviePlayerController *videoPlayer;
}
@end

@implementation ViewController

/* Main */
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"a3" ofType:@"aif"];
    NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID((CFURLRef)soundURL, &shortSoundID);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_playButton release];
    AudioServicesDisposeSystemSoundID(shortSoundID);
    [audioPlayer release];
    [videoPlayer release];
    [super dealloc];
}

/* Boutons */
- (IBAction)playButtonPressed:(id)sender
{
    //  AudioServicesPlaySystemSound(shortSoundID);
    if (audioPlayer == nil) {
        NSString *mp3Path = [[NSBundle mainBundle] pathForResource:@"keyboard_cat_ringtone" ofType:@"mp3"];
        NSURL *mp3URL = [NSURL fileURLWithPath:mp3Path];
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:mp3URL error:NULL];
        audioPlayer.delegate = self;
    }
    //    audioPlayer.isPlaying ? [audioPlayer stop] : [audioPlayer play];
    if (audioPlayer.isPlaying) {
        [audioPlayer stop];
        [self.playButton setTitle:@"Play Music" forState:UIControlStateNormal];
    }
    else {
        [audioPlayer play];
        [self.playButton setTitle:@"Stop Music" forState:UIControlStateNormal];
    }

    
}

- (IBAction)videoButtonPressed:(id)sender
{
    [self playMovie];
}


/* Méthodes audio */
- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player withOptions:(NSUInteger)flags
{
    [audioPlayer play];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [self.playButton setTitle:@"Play Music" forState:UIControlStateNormal];
}

/* Méthodes vidéo */
- (void)playMovie
{
    if (videoPlayer == nil) {
        NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"keyboard_cat" ofType:@"mp4"];
        NSURL *videoURL = [NSURL fileURLWithPath:videoPath];
        videoPlayer = [[MPMoviePlayerController alloc] initWithContentURL:videoURL];
        videoPlayer.view.frame = self.view.bounds;
        [self.view addSubview:videoPlayer.view];
    }
    [videoPlayer play];
   
}

@end
