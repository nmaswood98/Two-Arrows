//
//  StatsScene.m
//  TwoArrows
//
//  Created by Nabhan maswood on 4/5/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "StatsScene.h"
#import "MenuScene.h"

@interface StatsScene(){
    CCColor *col ;
    CCColor *col2;


}
    
@end

@implementation StatsScene

-(id)init{
    self = [super init];
    
    col = [CCColor  colorWithRed:0.24 green:0.45 blue:0.64 alpha:1.0];
    col2 = [CCColor colorWithRed:0.30 green:0.28 blue:0.28 alpha:1.0];
    
    [self setUpScene];
    
    return self;
}

-(void)goHome{
    id gameplayScene = [MenuScene node];
    
   
    [[CCDirector sharedDirector] replaceScene:gameplayScene];



}

-(void)setUpScene{
    CCNodeColor *background = [CCNodeColor nodeWithColor:[CCColor whiteColor]];
    [self addChild:background];
   CCLabelTTF *title = [CCLabelTTF labelWithString:@"Stats" fontName:@"LeoArrow-Regular" fontSize:40];
    title.position = ccp(self.contentSize.width/2,self.contentSize.height/1.15);
    title.color = col;
    [self addChild:title];
    
    NSInteger prevTotal = [[NSUserDefaults standardUserDefaults] integerForKey:@"Total_Arrows"];
     NSInteger failsRush = [[NSUserDefaults standardUserDefaults] integerForKey:@"NumberOf_Misses_OnRush"];
     NSInteger failsMindBend = [[NSUserDefaults standardUserDefaults] integerForKey:@"NumberOf_Misses_OnMindBend"];
     NSInteger rushHighScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"Rush_High_score"];
     NSInteger mindbendHighScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"MindBend_High_score"];
    
    
    
    
    CCLabelTTF *arrowLabels = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Total arrows acquired: %tu",prevTotal] fontName:@"LeoArrow-Regular" fontSize:20];
    CCLabelTTF *rushMissLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Fails on Rush: %tu",failsRush] fontName:@"LeoArrow-Regular" fontSize:20];
    CCLabelTTF *MindBendMissLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Fails on MindBend: %tu",failsMindBend] fontName:@"LeoArrow-Regular" fontSize:20];
    CCLabelTTF *rushHighScoreLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Rush Highscore: %tu",rushHighScore] fontName:@"LeoArrow-Regular" fontSize:20];
    CCLabelTTF *MindbendHighScoreLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"MindBend Highscore: %tu",mindbendHighScore] fontName:@"LeoArrow-Regular" fontSize:20];
    
    rushHighScoreLabel.position = ccp(self.contentSize.width/2,self.contentSize.height/1.45 + 20);
    MindbendHighScoreLabel.position = ccp(self.contentSize.width/2,self.contentSize.height/1.45 - 14);
    arrowLabels.position = ccp(self.contentSize.width/2,self.contentSize.height/1.45 -48);
    rushMissLabel.position = ccp(self.contentSize.width/2,self.contentSize.height/1.45 -82);
    MindBendMissLabel.position = ccp(self.contentSize.width/2,self.contentSize.height/1.45 - 116);
    
//    arrowLabels.position = ccp(self.contentSize.width/2,self.contentSize.height/1.5 + 10);
//    rushMissLabel.position = ccp(self.contentSize.width/2,self.contentSize.height/1.5 - 19);
//    MindBendMissLabel.position = ccp(self.contentSize.width/2,self.contentSize.height/1.5 -48);
//    rushHighScoreLabel.position = ccp(self.contentSize.width/2,self.contentSize.height/1.5 -77);
//    MindbendHighScoreLabel.position = ccp(self.contentSize.width/2,self.contentSize.height/1.5 - 106);
    
    arrowLabels.fontColor = [CCColor blackColor];
    MindBendMissLabel.fontColor = [CCColor blackColor];
    rushMissLabel.fontColor = [CCColor blackColor];
    rushHighScoreLabel.fontColor = [CCColor blackColor];
    MindbendHighScoreLabel.fontColor = [CCColor blackColor];
    
    [self addChild:arrowLabels];
    [self addChild:rushMissLabel];
    [self addChild:MindBendMissLabel];
    [self addChild:rushHighScoreLabel];
    [self addChild:MindbendHighScoreLabel];

    CCButton *homeButton = [CCButton buttonWithTitle:@"Home" fontName:@"LeoArrow-Regular" fontSize:30];
    homeButton.position = ccp(self.contentSize.width/2, self.contentSize.height/3);
    homeButton.color = [CCColor blackColor];
    [homeButton setTarget:self selector:@selector(goHome)];
    
    [self addChild:homeButton];


}



@end
