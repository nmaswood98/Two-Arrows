//
//  OptionsScene.m
//  TwoArrows
//
//  Created by Nabhan maswood on 4/5/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "OptionsScene.h"
#import "TutorialScene.h"
#import "MenuScene.h"
#import "volumeSprite.h"

@interface OptionsScene(){

    CCColor *col;
    CCColor *col2;


}



@end

@implementation OptionsScene

-(id)init{
    self = [super init];
    
    col = [CCColor  colorWithRed:0.24 green:0.45 blue:0.64 alpha:1.0];
    col2 = [CCColor colorWithRed:0.30 green:0.28 blue:0.28 alpha:1.0];

    [self setUpScene];
    
    
    return self;
}

-(void)goToTutorial{
    id gameplayScene = [TutorialScene nodeInOptions];
    CCTransition *transition = [CCTransition transitionRevealWithDirection:CCTransitionDirectionLeft duration:.5];
    [[CCDirector sharedDirector] replaceScene:gameplayScene withTransition:transition];

}

-(void)goHome{
    id gameplayScene = [MenuScene node];
    
    
    [[CCDirector sharedDirector] replaceScene:gameplayScene];

}

-(void)moreApps{
    NSString *str = @"https://itunes.apple.com/us/artist/nabhan-maswood/id866715084";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

-(void)setUpScene{
    CCNodeColor *background = [CCNodeColor nodeWithColor:[CCColor whiteColor]];
    [self addChild:background];

    CCLabelTTF *title = [CCLabelTTF labelWithString:@"Options" fontName:@"LeoArrow-Regular" fontSize:40];
    title.position = ccp(self.contentSize.width/2,self.contentSize.height/1.15);
    title.color = col;
    [self addChild:title];
    
    CCLabelTTF *name = [CCLabelTTF labelWithString:@"Developed by: Nabhan Maswood" fontName:@"LeoArrow-Regular" fontSize:16];
    name.position = ccp(self.contentSize.width/2, self.contentSize.height/1.7 - 126);
    
    name.color = col;
    [self addChild:name];
    
    CCButton *tutorialButton = [CCButton buttonWithTitle:@"Tutorial" fontName:@"LeoArrow-Regular" fontSize:30];
    tutorialButton.position = ccp(self.contentSize.width/2, self.contentSize.height/1.7);
    tutorialButton.color = [CCColor blackColor];
    [tutorialButton setTarget:self selector:@selector(goToTutorial)];
    
    [self addChild:tutorialButton];
    
    CCButton *moreAppsButton = [CCButton buttonWithTitle:@"More Apps" fontName:@"LeoArrow-Regular" fontSize:30];
    moreAppsButton.position = ccp(self.contentSize.width/2 + 5, self.contentSize.height/1.7 - 60);
    moreAppsButton.color = [CCColor blackColor];
    [moreAppsButton setTarget:self selector:@selector(moreApps)];
    
    [self addChild:moreAppsButton];
    
    CCButton *homeButton = [CCButton buttonWithTitle:@"Home" fontName:@"LeoArrow-Regular" fontSize:30];
    homeButton.position = ccp(self.contentSize.width/2,self.contentSize.height/4 );
    homeButton.color = [CCColor blackColor];
    [homeButton setTarget:self selector:@selector(goHome)];
    
    [self addChild:homeButton];
    
    
    volumeSprite *vol = [volumeSprite spriteWithImageNamed:@"VolumeButton1.png"];
    vol.position = ccp(self.contentSize.width/2, self.contentSize.height/1.4);
    [vol setScale:.4];
    [self addChild:vol];



}

@end
