//
//  MenuScene.m
//  TwoArrows
//
//  Created by Nabhan maswood on 1/31/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "MenuScene.h"
#import "TwoArrowsMainScene.h"
#import "MindBendScene.h"
#import "volumeSprite.h"
#import "OptionsScene.h"
#import "StatsScene.h"
#import "RushTutorialScene.h"
#import "MindBendTutorialScene.h"
#import "AppDelegate.h"

@interface MenuScene(){

    CCLabelTTF *but;
    BOOL swith ;
    CCColor *col ;
    CCColor *col2;
    NSNumber *prevNumber;
    NSNumber *previousScore;
}

@end

@implementation MenuScene

-(void)rate{
    
    NSString *str = @"https://itunes.apple.com/app/id983383596";

    //NSString *str = @"https://itunes.apple.com/us/artist/nabhan-maswood/id866715084";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];

}



-(void)touchMoved:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
 }

-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    
   

}


-(void)startGame{
    AppController *app = (AppController*)[UIApplication sharedApplication].delegate;
    [app removeAd];
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"tutorial2"]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"tutorial2"];
    id gameplayScene = [RushTutorialScene node];
    CCTransition *transition = [CCTransition transitionCrossFadeWithDuration:.2];
    [[CCDirector sharedDirector] replaceScene:gameplayScene withTransition:transition];
    }
    else{
        id gameplayScene = [TwoArrowsMainScene node];
      //  CCTransition *transition = [CCTransition transitionPushWithDirection:CCTransitionDirectionLeft duration:.5];
          CCTransition *transition = [CCTransition transitionCrossFadeWithDuration:.2];
        [[CCDirector sharedDirector] replaceScene:gameplayScene withTransition:transition];
    }


}

-(void)startGame2{
    AppController *app = (AppController*)[UIApplication sharedApplication].delegate;
    [app removeAd];
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"tutorial3"]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"tutorial3"];
        id gameplayScene = [MindBendTutorialScene node];
        CCTransition *transition = [CCTransition transitionPushWithDirection:CCTransitionDirectionLeft duration:.2];
        [[CCDirector sharedDirector] replaceScene:gameplayScene withTransition:transition];
    }
    else{
        id gameplayScene = [MindBendScene node];
        CCTransition *transition = [CCTransition transitionPushWithDirection:CCTransitionDirectionLeft duration:.2];
        [[CCDirector sharedDirector] replaceScene:gameplayScene withTransition:transition];
    }

    
}

-(void)goStats{

    id gameplayScene = [StatsScene node];
    
    
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

-(void)goOptions{

    id gameplayScene = [OptionsScene node];
    
    
    [[CCDirector sharedDirector] replaceScene:gameplayScene];

}


-(void)changeColors{
    if (swith) {
        but.color = col2;
        swith =false;
    }
    else{
        but.color = col;
        swith = true;
    }

[NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(changeColors) userInfo:nil repeats:NO];
}

-(void)addbuttons{
//    CCSpriteFrame *rushButtonImage = [CCSpriteFrame frameWithImageNamed:@"RushButton.png"];
//    CCSpriteFrame *MindBendImage = [CCSpriteFrame frameWithImageNamed:@"MindeBendButton.png"];
//    CCSpriteFrame *RateImage = [CCSpriteFrame frameWithImageNamed:@"RateButton.png"];
//    CCSpriteFrame *StatsImage = [CCSpriteFrame frameWithImageNamed:@"StatsButton.png"];
//    CCSpriteFrame *OptionImage = [CCSpriteFrame frameWithImageNamed:@"OptionsButtons.png"];
    
    CCSpriteFrame *rushButtonImage = [CCSpriteFrame frameWithImageNamed:@"RushButton1.png"];
    CCSpriteFrame *MindBendImage = [CCSpriteFrame frameWithImageNamed:@"MindBendButton1.png"];
    CCSpriteFrame *RateImage = [CCSpriteFrame frameWithImageNamed:@"RateButton1.png"];
    CCSpriteFrame *StatsImage = [CCSpriteFrame frameWithImageNamed:@"StatsButton1.png"];
    CCSpriteFrame *OptionImage = [CCSpriteFrame frameWithImageNamed:@"OptionsButton1.png"];
    
    //CCNodeColor *background = [CCNodeColor nodeWithColor:[CCColor colorWithRed:157 green:5 blue:227]];
    CCNodeColor *background = [CCNodeColor nodeWithColor:[CCColor whiteColor]];

    [self addChild:background];
    but = [CCLabelTTF labelWithString:@"Two Arrows" fontName:@"LeoArrow-Regular" fontSize:40];
    but.position = ccp(self.contentSize.width/2,self.contentSize.height/1.15);
    but.color = col;
    [self addChild:but];
    [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(changeColors) userInfo:nil repeats:NO];
    CCButton *button = [CCButton buttonWithTitle:nil spriteFrame:rushButtonImage];
    button.position = ccp(self.contentSize.width/2,self.contentSize.height/1.35);
    button.color = [CCColor blackColor];
    button.scale = .11;
    [button setTarget:self selector:@selector(startGame)];
    [self addChild:button];
    
    CCButton *button2 = [CCButton buttonWithTitle:nil spriteFrame:MindBendImage];
    
    button2.position = ccp(self.contentSize.width/2,self.contentSize.height/1.35 - 60);
    button2.colorRGBA = [CCColor blackColor];
    
    button2.scale = .11;
    [button2 setTarget:self selector:@selector(startGame2)];
    [self addChild:button2];
    
    CCButton *button3 = [CCButton buttonWithTitle:nil spriteFrame:StatsImage];
    button3.position = ccp(self.contentSize.width/5,self.contentSize.height/2 - 80);
    button3.color = [CCColor blackColor];
    button3.scale = .09;
    [button3 setTarget:self selector:@selector(goStats)];
    [self addChild:button3];
    
    CCButton *button4 = [CCButton buttonWithTitle:nil spriteFrame:RateImage];
    button4.position = ccp(self.contentSize.width/2,self.contentSize.height/2 - 80);
    button4.color = [CCColor blackColor];
    button4.scale = .09;
    [button4 setTarget:self selector:@selector(rate)];
    [self addChild:button4];
    
    CCButton *button5 = [CCButton buttonWithTitle:nil spriteFrame:OptionImage];
    button5.position = ccp(self.contentSize.width/2 +96,self.contentSize.height/2 - 80);
    button5.color = [CCColor blackColor];
    button5.scale = .09;
    [button5 setTarget:self selector:@selector(goOptions)];
    [self addChild:button5];
    
    
    //volumeSprite *vol = [volumeSprite sp];
    



}

-(id)init{
    self = [super init];
    
    OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
    // play background sound
    [audio preloadEffect:@"Sound3.wav"];
    //[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"Volume_Off"];
    BOOL volOnorOff = [[NSUserDefaults standardUserDefaults] boolForKey:@"Volume_Off"];
    if (volOnorOff) {
        [audio setEffectsVolume:0];
    }else{
        [audio setEffectsVolume:1];
    }
    
    //col = [CCColor colorWithRed:0.24 green:0.52 blue:0.78 alpha:1.0];
  //  col2 = [CCColor colorWithRed:0.40 green:0.81 blue:0.22 alpha:1.0] ;
    //colorWithRed:0.11 green:0.27 blue:0.53 alpha:1.0
    col = [CCColor  colorWithRed:0.24 green:0.45 blue:0.64 alpha:1.0];
    col2 = [CCColor colorWithRed:0.30 green:0.28 blue:0.28 alpha:1.0];
    swith = true;
    self.userInteractionEnabled = YES;
    [self addbuttons];
    
   ArrowSprite *mainArrow = [ArrowSprite spriteWithImageNamed:@"Base1.png"];
    mainArrow.position = ccp(self.contentSizeInPoints.width/2 - 70,self.contentSizeInPoints.height/2 );
    mainArrow.color = col;
    [mainArrow setScale:.06];
    mainArrow.name = @"ARROW";
 
    [self addChild:mainArrow];
    
    
    
    CCSprite *mainArrow2 = [CCSprite spriteWithImageNamed:@"Arrow2222.png"];
    mainArrow2.position = ccp((self.contentSizeInPoints.width/2 - 70) + 35,self.contentSizeInPoints.height/2 );
    mainArrow2.color = col;
   
    mainArrow2.rotation = 0;
    [mainArrow2 setScale:.09];
    mainArrow.rotation = mainArrow2.rotation;
    
 
    [self addChild:mainArrow2];
    
    /////////
   CCSprite *mainArrow1 = [CCSprite spriteWithImageNamed:@"Base1.png"];
    mainArrow1.position = ccp(self.contentSizeInPoints.width/2 + 70,self.contentSizeInPoints.height/2  );
    mainArrow1.color = col2;
    [mainArrow1 setScale:.06];
    
   
 
    [self addChild:mainArrow1];
    
    
   CCSprite *mainArrow21 = [CCSprite spriteWithImageNamed:@"Arrow2222.png"];
    mainArrow21.position = ccp((self.contentSizeInPoints.width/2 + 70) - 35,self.contentSizeInPoints.height/2  );
    mainArrow21.color = col2;
    
    mainArrow21.rotation = 180;
    [mainArrow21 setScale:.09];
    mainArrow.rotation = mainArrow2.rotation;
    
    
    [self addChild:mainArrow21];
    
    
    
    return self;}






@end
