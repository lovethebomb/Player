//
//  ViewController.h
//  Player
//
//  Created by HEYMES Lucas on 25/10/12.
//  Copyright (c) 2012 Heymès Lucas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <AVAudioPlayerDelegate>

@property (retain, nonatomic) IBOutlet UIButton *playButton;

- (IBAction)playButtonPressed:(id)sender;
- (IBAction)videoButtonPressed:(id)sender;

@end
