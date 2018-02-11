//
//  MindBendEndScene.m
//  TwoArrows
//
//  Created by Nabhan maswood on 3/29/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "MindBendEndScene.h"
#import "MindBendScene.h"

@implementation MindBendEndScene

-(void)setUpScene{
    background = [CCNodeColor nodeWithColor:[CCColor whiteColor]];
    self.userInteractionEnabled = YES;
    [self addChild:background];
    lastGameScore = [NSString stringWithFormat:@"Score: %ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"Last_score"]];
    highScore = [NSString stringWithFormat:@"Best: %li",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"MindBend_High_score"]];
    modeName = @"MindBend";
}

-(void)retryMethod{
    id retryScene = [MindBendScene node];
    [[CCDirector sharedDirector] replaceScene:retryScene];
    
    
}

-(void)arrowsSet{
    NSInteger last =[[NSUserDefaults standardUserDefaults] integerForKey:@"Last_score"];
    NSInteger prevTotal = [[NSUserDefaults standardUserDefaults] integerForKey:@"Total_Arrows"];
    NSInteger misses = [[NSUserDefaults standardUserDefaults] integerForKey:@"NumberOf_Misses_OnMindBend"] + 1;
    [[NSUserDefaults standardUserDefaults] setInteger:misses forKey:@"NumberOf_Misses_OnMindBend"];
    [[NSUserDefaults standardUserDefaults] setInteger:prevTotal+last forKey:@"Total_Arrows"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
