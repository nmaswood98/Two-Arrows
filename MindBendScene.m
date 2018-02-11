//
//  MindBendScene.m
//  TwoArrows
//
//  Created by Nabhan maswood on 3/7/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "MindBendScene.h"
#import "MindBendEndScene.h"


@interface MindBendScene(){
    
    NSNumber *prevNumber;
    NSNumber *previousScore;
    NSNumber *previousScore2;
    
    bool ball;
    bool ball2;
    BOOL go;
    BOOL go2;
  
    CCTimer *tim;
    CCTimer *tim2;
    CCTimer *tim3;
    int ran;
    int ran2;
    int ran3;
    int ran4;
}
@end
@implementation MindBendScene

-(void)setIntialValues{
    [super setIntialValues];
    randoSphereCount = 2;
    
    
}

-(id)init{
    self = [super init];
    ball = true;
     ball2 = true;
    go = YES;
    go2 = YES;
    ran = 0;
    ran2 = 0;
    //physicsWorld.debugDraw=YES;
       return self;
}

-(void)endGame{
    ran3++;
    if (ran3 == 1) {
        
        id endScenes = [MindBendEndScene node];
        [[CCDirector sharedDirector]replaceScene:endScenes];
    }
    
}

-(void)setHighScoreOnMindBend{
    HigherScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"MindBend_High_score"];
    if (score > HigherScore) {
        [[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"MindBend_High_score"];
    }

}



-(void)setRan{
    ran = 0;}

-(void)setRan2{
    ran2 = 0;}

-(void)setRan4{
    ran4 = 0;}

-(void)playSound{
    ran4++;
    if (ran4 == 1) {
        tim3 = [self scheduleOnce:@selector(setRan4) delay:.3];
        [audio playEffect:@"Sound3.wav"];
    }
    else if (ran4 > 1){
        ran4 = 0;
    }
    
    
}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair MainArrow:(CCSprite *)node ArrowFalls:(CCSprite *)nodeB{
    ran++;
    if (ran == 1) {
        tim = [self scheduleOnce:@selector(setRan) delay:.3];
       // tim = [NSTimer scheduledTimerWithTimeInterval:.3 target:self selector:@selector(setRan) userInfo:nil repeats:NO];
        //
        if (lroundf(mainArrow21.position.x) == lroundf(nodeB.position.x) && [nodeB.color isEqual:col2]){
            [self playSound];
            [nodeB removeFromParent];
            [self scorePlusPLus];
            [[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"Last_score"];
            [self setHighScoreOnMindBend];
        }
        else if(!(lroundf(mainArrow21.position.x) == lroundf(nodeB.position.x))&& ![nodeB.color isEqual:col2]){
            [self playSound];
            [nodeB removeFromParent];
            [self scorePlusPLus];
            [[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"Last_score"];
            [self setHighScoreOnMindBend];
        }
        else{
            [[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"Last_score"];
            [self setHighScoreOnMindBend];
            self.userInteractionEnabled = NO;
            [nodeB stopAllActions];
            nodeB.physicsBody = nil;
            runGame = NO;
            CCActionScaleBy *scale = [CCActionScaleBy actionWithDuration:.5 scale:1.5];
            CCActionScaleBy *scales = [CCActionScaleBy actionWithDuration:.5 scale:1/1.5];
            CCActionCallFunc *end = [CCActionCallFunc actionWithTarget:self selector:@selector(endGame)];
            
            CCActionSequence *seq = [CCActionSequence actionWithArray:@[scale,scales,scale,end]];
            [nodeB runAction:seq];
        }
        //
        }
    
    else if (ran > 1) {
        ran = 0;
        }
   
    return YES;
}




-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair MainArrow:(CCSprite *)node ArrowFall:(CCSprite *)nodeB{
    ran2++;
    if (ran2 == 1) {
        tim2 = [self scheduleOnce:@selector(setRan2) delay:.3];
       // tim2 = [NSTimer scheduledTimerWithTimeInterval:.3 target:self selector:@selector(setRan2) userInfo:nil repeats:NO];
        //
        if (lroundf(mainArrow2.position.x) == lroundf(nodeB.position.x) && [nodeB.color isEqual:col]){
            
            // play background sound
            [self playSound];
            
            [nodeB removeFromParent];
            [self scorePlusPLus];
            [[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"Last_score"];
            [self setHighScoreOnMindBend];
        }
        else if(!(lroundf(mainArrow2.position.x) == lroundf(nodeB.position.x))&& ![nodeB.color isEqual:col]){
            [self playSound];
            [nodeB removeFromParent];
            [self scorePlusPLus];
            
            [[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"Last_score"];
            [self setHighScoreOnMindBend];
        }
        else{
            [[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"Last_score"];
            [self setHighScoreOnMindBend];
            self.userInteractionEnabled = NO;
            [nodeB stopAllActions];
            nodeB.physicsBody = nil;
            runGame = NO;
            CCActionScaleBy *scale = [CCActionScaleBy actionWithDuration:.5 scale:1.5];
            CCActionScaleBy *scales = [CCActionScaleBy actionWithDuration:.5 scale:1/1.5];
            CCActionCallFunc *end = [CCActionCallFunc actionWithTarget:self selector:@selector(endGame)];
            
            CCActionSequence *seq = [CCActionSequence actionWithArray:@[scale,scales,scale,end]];
            [nodeB runAction:seq];
        }
        //
        }
    
    else if (ran2 > 1) {
        ran2 = 0;
    }
    
    return YES;
}



-(void)update:(CCTime)delta{
    // runGame = YES;
    //waitTime = .3;
    //durationForSpeed = .5;
    if (score < 57){
        waitTime = 1.0 - (score * .0085);
        durationForSpeed = 1.0 - (score * .0085);
    }
    else if(score > 57 ){
        waitTime = .5;
        durationForSpeed = .5;
    }
    
    
    
    
    
    
}





@end
