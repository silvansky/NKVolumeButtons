//
//  NKVolumeButtons.m
//
//  Created by Nikita Kolmogorov on 10.06.13.
//  Copyright (c) 2013 Nikita Kolmogorov. All rights reserved.
//

#import "NKVolumeButtons.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation NKVolumeButtons

@synthesize upBlock = _upBlock;
@synthesize downBlock = _downBlock;

- (id)init
{
    self = [super init];
    if (self) {
        // Hide the volume indicator
        CGRect frame = CGRectMake(0, -100, 10, 0);
        UIView *volumeView = [[MPVolumeView alloc] initWithFrame:frame];
        [volumeView sizeToFit];
        [[[[UIApplication sharedApplication] windows] objectAtIndex:0] addSubview:volumeView];
        
        // We need to make the volume default at start
        [[MPMusicPlayerController applicationMusicPlayer] setVolume:0.5];
        
        // Add self as observer of MusicPlayer's volume property
        [[MPMusicPlayerController applicationMusicPlayer] addObserver:self forKeyPath:@"volume" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self checkVolumeButtons];
}

- (void)checkVolumeButtons {
    
    // Let's get current volume!
    float currentVolume = [[MPMusicPlayerController applicationMusicPlayer] volume];
    
    // Check if it went down or up
    if (currentVolume > 0.5) {
        [self volumeUp];
    } else if (currentVolume < 0.5) {
        [self volumeDown];
    }
    
    // Come back to default volume
    [[MPMusicPlayerController applicationMusicPlayer] setVolume:0.5];
}

- (void)volumeUp {
    if(self.upBlock) {
        self.upBlock();
    }
}

- (void)volumeDown {
    if(self.upBlock) {
        self.upBlock();
    }
}

@end
