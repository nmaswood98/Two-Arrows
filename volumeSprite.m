//
//  volumeSprite.m
//  TwoArrows
//
//  Created by Nabhan maswood on 4/5/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "volumeSprite.h"
@interface volumeSprite(){
    OALSimpleAudio *audio;
   
    CCSpriteFrame *frame1;
    CCSpriteFrame *frame2;

}

@end

@implementation volumeSprite



-(id)initWithImageNamed:(NSString *)imageName{
    
    audio = [OALSimpleAudio sharedInstance];
    frame1 = [CCSpriteFrame frameWithImageNamed:@"VolumeButton1.png"];
    frame2 = [CCSpriteFrame frameWithImageNamed:@"VolumeButton2.png"];
    if (audio.effectsVolume == 0) {
         self = [super initWithImageNamed:@"VolumeButton2.png"];
    }
    else{
    
     self = [super initWithImageNamed:imageName];
    }
    self.userInteractionEnabled = YES;
   
    
    
    return self;
}



-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    
    
   
    

    if (audio.effectsVolume == 1) {
        
       [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"Volume_Off"];
        [audio setEffectsVolume:0];
        self.spriteFrame = frame2;
        
    }
    else if(audio.effectsVolume == 0){
        
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"Volume_Off"];
        //[[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Volume_OnorOff"];
        [audio setEffectsVolume:1];
        
    self.spriteFrame = frame1;
        [audio playEffect:@"Sound3.wav"];
        
    }
    

}


@end
