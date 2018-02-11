//
//  TwoArrowsMainScene.h
//  TwoArrows
//
//  Created by Nabhan maswood on 1/25/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "CCScene.h"
#import "ArrowSprite.h"

@interface TwoArrowsMainScene : CCScene <CCPhysicsCollisionDelegate>{

    CCPhysicsNode *physicsWorld;
    
    CCNodeColor *background;
    ArrowSprite *mainArrow;
    ArrowSprite *mainArrow2;
    ArrowSprite *mainArrow1;
    ArrowSprite *mainArrow21;
    
    CCColor *arrow1Color;
    CCColor *arrow2Color;
    
    CCLabelTTF *scoreLabel;
    ArrowSprite *ArrowFall;
    ArrowSprite *ArrowFallz;
    ArrowSprite *chromaArrow;
    CCActionRepeatForever *runs;
    CCActionRepeatForever *runs2;
    float durationForSpeed;
   
    NSInteger HigherScore;
    NSInteger speedY;
    NSInteger speedX;
   NSInteger score;
    CGPoint mainArrow2pos;
    CGPoint mainArrow21pos;
    BOOL Turn;
    BOOL Turns;
    BOOL run;
    BOOL Switchs;
    BOOL Switchss;
    BOOL otherArrow;
    BOOL DisAble;
    float waitTime;
    BOOL runGame;
    BOOL runRecursiveTimer;
    int randoSphereCount;
    BOOL _dontcalltwice;
    BOOL _dontcalltwice1;
    CCColor *col ;
    CCColor *col2;
    
    OALSimpleAudio *audio;
    
}

-(void)setIntialValues;
- (void)scorePlusPLus ;
- (void)scorePlusPLus2;
-(void)startGame;
-(void)settss;

@end
