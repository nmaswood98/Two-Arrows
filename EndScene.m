//
//  EndScene.m
//  TwoArrows
//
//  Created by Nabhan maswood on 3/22/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "EndScene.h"
#import "MenuScene.h"
#import "TwoArrowsMainScene.h"
#import "volumeSprite.h"
#import "AppDelegate.h"

@implementation EndScene

-(void)setUpScene{
    background = [CCNodeColor nodeWithColor:[CCColor whiteColor]];
    self.userInteractionEnabled = YES;
    [self addChild:background];
    lastGameScore = [NSString stringWithFormat:@"Score: %ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"Last_score"]];
    highScore = [NSString stringWithFormat:@"Best: %li",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"Rush_High_score"]];
    modeName = @"Rush";
    
  
    
   
}

-(void)homeMethod{
    AppController *app = (AppController*)[UIApplication sharedApplication].delegate;
    [app addAd];
    id homeScene = [MenuScene node];
    [[CCDirector sharedDirector] replaceScene:homeScene];
    
}

-(void)retryMethod{
    id retryScene = [TwoArrowsMainScene node];
    [[CCDirector sharedDirector] replaceScene:retryScene];

  
}

-(void)arrowsSet{
    NSInteger last =[[NSUserDefaults standardUserDefaults] integerForKey:@"Last_score"];
    NSInteger prevTotal = [[NSUserDefaults standardUserDefaults] integerForKey:@"Total_Arrows"];
    NSInteger misses = [[NSUserDefaults standardUserDefaults] integerForKey:@"NumberOf_Misses_OnRush"] + 1;
    [[NSUserDefaults standardUserDefaults] setInteger:misses forKey:@"NumberOf_Misses_OnRush"];
    [[NSUserDefaults standardUserDefaults] setInteger:prevTotal+last forKey:@"Total_Arrows"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
    
}

- (instancetype)init
{
    self = [super init];
    [self setUpScene];
   
    volumeSprite *vol = [volumeSprite spriteWithImageNamed:@"VolumeButton1.png"];
    vol.position = ccp(self.contentSize.width/9,self.contentSize.height/1.05);
    [vol setScale:.3];
    [self addChild:vol];
    
    
    
    [self arrowsSet];
    CCLabelTTF *modeLabel = [CCLabelTTF labelWithString:modeName fontName:@"LeoArrow-Regular" fontSize:50];
    modeLabel.position = ccp(self.contentSize.width/2,self.contentSize.height/1.3);
    modeLabel.color = [CCColor blackColor];
    [self addChild:modeLabel];
    
    CCLabelTTF *scoreLabel = [CCLabelTTF labelWithString:lastGameScore fontName:@"LeoArrow-Regular" fontSize:40];
    scoreLabel.position = ccp(self.contentSize.width/2, self.contentSize.height/1.7);
    scoreLabel.color = [CCColor blackColor];
    [self addChild:scoreLabel];
    
    CCLabelTTF *highScoreLabel = [CCLabelTTF labelWithString:highScore fontName:@"LeoArrow-Regular" fontSize:35];
    highScoreLabel.position = ccp(self.contentSize.width/2, (self.contentSize.height/1.7) - 100);
    highScoreLabel.color = [CCColor blackColor];
    [self addChild:highScoreLabel];
    
    CCButton *retryButton = [CCButton buttonWithTitle:@"Retry" fontName:@"LeoArrow-Regular" fontSize:30];
    retryButton.position = ccp(self.contentSize.width/4,self.contentSize.height/4);
    retryButton.color =[CCColor blackColor];
    [retryButton setTarget:self selector:@selector(retryMethod)];
    [self addChild:retryButton];
    
    CCButton *homeButton = [CCButton buttonWithTitle:@"Home" fontName:@"LeoArrow-Regular" fontSize:30];
    homeButton.position = ccp(240,self.contentSize.height/4);
    homeButton.color = [CCColor blackColor];
    [homeButton setTarget:self selector:@selector(homeMethod)];
    [self addChild:homeButton];
    
    
    
    
    
    
    
    return self;
}

-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{


}


@end
