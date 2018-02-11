//
//  TwoArrowsMainScene.m
//  TwoArrows
//
//  Created by Nabhan maswood on 1/25/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "TwoArrowsMainScene.h"
#import "ArrowSprite.h"
#import "EndScene.h"
#import "cocos2d.h"


@interface TwoArrowsMainScene(){

    NSInteger _leftArrowCount;
    NSInteger _rightArrowCount;
    NSInteger _chromaArrowCount;
    NSNumber *previousScore2;
    
    NSString  *scoreString;
   
    CCSpriteFrame *arrowFrame ;
    bool swag;
    
    CCTimer *tim;
    CCTimer *tim2;
    CCTimer *tim3;
   
    int ran;
    int ran2;
    int ran3;
    int ran4;
    BOOL ball;
    BOOL ball2;
    BOOL gooo;
    CCActionDelay *_wait;
   
}

@end

@implementation TwoArrowsMainScene





-(void)onEnter{
    [super onEnter];
    self.multipleTouchEnabled = YES;
    self.userInteractionEnabled = YES;
}

-(void)setIntialValues{
    
    
    col = [CCColor  colorWithRed:0.24 green:0.45 blue:0.64 alpha:1.0];
    col2 = [CCColor colorWithRed:0.30 green:0.28 blue:0.28 alpha:1.0]; ;
    arrow1Color = col;
    arrow2Color = col2;
    Turn = true;
    run = true;
    Switchs = true;
    Switchss = true;
    otherArrow = false;
    DisAble = true;
    durationForSpeed = 1;
    speedY = 0;
    speedX = -300;
    score = 0;
    randoSphereCount = 1;
    _dontcalltwice = YES;
    _dontcalltwice1 = YES;
    waitTime = 1;
    // swag = true;
    runGame = YES;
    arrowFrame = [CCSpriteFrame frameWithImageNamed:@"Arrow2222.png"];

}

-(void)settss{
        audio = [OALSimpleAudio sharedInstance];
    background = [CCNodeColor nodeWithColor:[CCColor whiteColor]];
    [self addChild:background];
    self.anchorPoint = ccp(0, 0);
    physicsWorld = [CCPhysicsNode node];
    physicsWorld.gravity = ccp(0,0);
    // physicsWorld.debugDraw = YES;
    physicsWorld.collisionDelegate = self;
    [self addChild:physicsWorld];
    [self setIntialValues];
    //  background.position = ccp(self.contentSizeInPoints.width/2 ,0);
    
    scoreLabel = [CCLabelTTF labelWithString:@"0" fontName:@"LeoArrow-Regular" fontSize:30];
    scoreLabel.position = ccp(self.contentSize.width/2,self.contentSize.height/1.5);
    scoreLabel.fontColor = [CCColor blackColor];
    [self addChild:scoreLabel];
    
    mainArrow = [ArrowSprite spriteWithImageNamed:@"Base1.png"];
    mainArrow.position = ccp(self.contentSizeInPoints.width/2 - 70,self.contentSizeInPoints.height/2 );
    mainArrow.color = arrow1Color;
    mainArrow.isRotation0 = true;
    [mainArrow setScale:.06];
    

    [self addChild:mainArrow];
     //physicsWorld.debugDraw=YES;
    
    mainArrow2 = [ArrowSprite spriteWithImageNamed:@"Arrow2222.png"];
    mainArrow2.position = ccp((self.contentSizeInPoints.width/2 - 70) + 35,self.contentSizeInPoints.height/2 );
    mainArrow2.color = arrow1Color;
    mainArrow2.isRotation0 = true;
    mainArrow2.rotation = 0;
    [mainArrow2 setScale:.09];
    mainArrow.rotation = mainArrow2.rotation;
    
    mainArrow2.physicsBody = [CCPhysicsBody bodyWithRect:(CGRect){ccp(-250,0),CGSizeMake(mainArrow2.contentSize.width + 250, mainArrow2.contentSize.height)}cornerRadius:0];
  
    mainArrow2.physicsBody.collisionType = @"MainArrow";
    mainArrow2.physicsBody.collisionGroup  = @"same";
    mainArrow2.physicsBody.affectedByGravity = false;
    [physicsWorld addChild:mainArrow2];
    
    /////////
    mainArrow1 = [ArrowSprite spriteWithImageNamed:@"Base1.png"];
    mainArrow1.position = ccp(self.contentSizeInPoints.width/2 + 70,self.contentSizeInPoints.height/2  );
    mainArrow1.color = arrow2Color;
    [mainArrow1 setScale:.06];
    
  
    [self addChild:mainArrow1];
    
    
    mainArrow21 = [ArrowSprite spriteWithImageNamed:@"Arrow2222.png"];
    mainArrow21.position = ccp((self.contentSizeInPoints.width/2 + 70) - 35,self.contentSizeInPoints.height/2  );
    mainArrow21.color = arrow2Color;
    mainArrow21.isRotation0 = false;
    mainArrow21.rotation = 180;
    [mainArrow21 setScale:.09];
    mainArrow.rotation = mainArrow2.rotation;
    
    mainArrow21.physicsBody = [CCPhysicsBody bodyWithRect:(CGRect){ccp(-250,0),CGSizeMake(mainArrow21.contentSize.width + 250, mainArrow21.contentSize.height)}cornerRadius:0];
    mainArrow21.physicsBody.collisionType = @"MainArrow";
    mainArrow21.physicsBody.collisionGroup  = @"same";
    mainArrow21.physicsBody.affectedByGravity = false;
    [physicsWorld addChild:mainArrow21];
    ///////////
    [self scheduleOnce:@selector(startGame) delay:waitTime];
    //[NSTimer scheduledTimerWithTimeInterval:waitTime target:self selector:@selector(startGame) userInfo:nil repeats:NO];
   
    

}



-(id)init{
    self = [super init];
   
    [self settss];
    return self;
    
    }

- (void)scorePlusPLus {
    score++;
    if (score == 6) {
        
    }
    scoreString = [NSString stringWithFormat:@"%ld",(long)score];
    scoreLabel.string = scoreString;
    
}
- (void)scorePlusPLus2 {
    score++;
    if (score == 6) {
        
    }
    scoreString = [NSString stringWithFormat:@"%ld",(long)score];
    scoreLabel.string = scoreString;
   
}


-(void)setHighScoreOnRush{
    HigherScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"Rush_High_score"];
    if (score > HigherScore) {
        [[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"Rush_High_score"];
    }
    
}

-(void)endGame{
    ran3++;
    if (ran3 == 1) {
           id endScenes = [EndScene node];
    
        [[CCDirector sharedDirector]replaceScene:endScenes];}


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
        //tim = [NSTimer scheduledTimerWithTimeInterval:.3 target:self selector:@selector(setRan) userInfo:nil repeats:NO];
        //
        if (lroundf(mainArrow21.position.x) == lroundf(nodeB.position.x) && [nodeB.color isEqual:col2]){
            [nodeB removeFromParent];
            
            // play background sound
            
            [self playSound];
            [self scorePlusPLus];
            [self setHighScoreOnRush];
            [[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"Last_score"];
        }
        else if(!(lroundf(mainArrow21.position.x) == lroundf(nodeB.position.x))&& ![nodeB.color isEqual:col2]){
           [ self scorePlusPLus];
        }
        else{
            [[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"Last_score"];
            [self setHighScoreOnRush];
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
    else{
    
    
       
    
    }
    return YES;
}




-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair MainArrow:(CCSprite *)node ArrowFall:(CCSprite *)nodeB{
    ran2++;
    if (ran2 == 1) {
        tim2 = [self scheduleOnce:@selector(setRan2) delay:.3];
        //tim2 = [NSTimer scheduledTimerWithTimeInterval:.3 target:self selector:@selector(setRan2) userInfo:nil repeats:NO];
        //
        if (lroundf(mainArrow2.position.x) == lroundf(nodeB.position.x) && [nodeB.color isEqual:col]){
            [nodeB removeFromParent];
            [self playSound];
            [self scorePlusPLus];
            [[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"Last_score"];
            [self setHighScoreOnRush];
        }
        else if(!(lroundf(mainArrow2.position.x) == lroundf(nodeB.position.x))&& ![nodeB.color isEqual:col]){
           
        }
        else{
            
            [[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"Last_score"];
            [self setHighScoreOnRush];
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





-(void)startGame{
    if(runGame){
        ArrowFall = [ArrowSprite spriteWithSpriteFrame:arrowFrame];
    
    int rand = arc4random_uniform(2) + 1;
    int randoSphere = arc4random_uniform(randoSphereCount) + 1;
    if (rand == 1) {
        ArrowFall.position = ccp((self.contentSizeInPoints.width/2 - 70)+35 ,self.contentSizeInPoints.height + 18 );
        ArrowFall.isRotation0 = true;
        ArrowFall.rotation = 0;
    }
    else if (rand == 2){
        
        ArrowFall.position = ccp((self.contentSizeInPoints.width/2 - 70) - 35 ,self.contentSizeInPoints.height + 18 );
        ArrowFall.isRotation0 = false;
        ArrowFall.rotation = 180;
        
    }
    else{
        
    }
    //randoSphere start
    ArrowFall.color = arrow1Color;
    if (randoSphere == 2){
        ArrowFall.color = arrow2Color;
    }
    else{
        ArrowFall.color = arrow1Color;
    }
        //ArrowFall.color = [arrow1Color];
        
    //randosphere end
    //Overide randoSphere
    //ArrowFall.color = [CCColor brownColor];
    //Overide randoSphere end
    
    //mainArrow2.rotation = 180;
    [ArrowFall setScale:.09];
    //[self addChild:mainArrow2];
    
    ArrowFall.physicsBody = [CCPhysicsBody bodyWithRect:(CGRect){CGPointZero, ArrowFall.contentSize} cornerRadius:0];
    ArrowFall.physicsBody.collisionType = @"ArrowFall";
    ArrowFall.physicsBody.affectedByGravity = false;
    [physicsWorld addChild:ArrowFall];
    
    CCActionMoveBy *move = [CCActionMoveBy actionWithDuration:durationForSpeed position:ccp(speedY, speedX)];
    [ArrowFall runAction:move];

    
    
    
    
    
    
    
    
    ArrowFallz = [ArrowSprite spriteWithSpriteFrame:arrowFrame];
    int rand2 = arc4random_uniform(2) + 1;
    int randoSphere2 = arc4random_uniform(randoSphereCount) + 1;
    if (rand2 == 1) {
        ArrowFallz.isRotation0 = true;
        ArrowFallz.position = ccp((self.contentSizeInPoints.width/2 + 70)+35 ,self.contentSizeInPoints.height + 18 );
        ArrowFallz.rotation = 0;
    }
    else if (rand2 == 2){
        ArrowFallz.isRotation0 = false;
        ArrowFallz.position = ccp((self.contentSizeInPoints.width/2 + 70) - 35 ,self.contentSizeInPoints.height + 18 );
        ArrowFallz.rotation = 180;
        
    }
    else{
        
    }
    
    ArrowFallz.color = arrow2Color;
    if (randoSphere2 == 2){
        ArrowFallz.color = arrow1Color;
    }
    else{
        ArrowFallz.color = arrow2Color;
    }
    
    
    //ArrowFallz.color = arrow2Color;
       
    //mainArrow2.rotation = 180;
    [ArrowFallz setScale:.09];
    //[self addChild:mainArrow2];
    
    ArrowFallz.physicsBody = [CCPhysicsBody bodyWithRect:(CGRect){CGPointZero, ArrowFallz.contentSize} cornerRadius:0];
    ArrowFallz.physicsBody.collisionType = @"ArrowFalls";
    ArrowFallz.physicsBody.affectedByGravity = false;
    [physicsWorld addChild:ArrowFallz];
   
    CCActionMoveBy *move2 = [CCActionMoveBy actionWithDuration:durationForSpeed position:ccp(speedY, speedX)];
    
    [ArrowFallz runAction:move2];
 [self scheduleOnce:@selector(startGame) delay:waitTime];
//[NSTimer scheduledTimerWithTimeInterval:waitTime target:self selector:@selector(startGame) userInfo:nil repeats:NO];
    }
}



-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
   
   
    
    if (touch.locationInWorld.x < self.contentSizeInPoints.width/2) {

       
            
            
            if (Turn) {
                
                
                mainArrow2.position = ccp((self.contentSizeInPoints.width/2 - 70) - 35,self.contentSizeInPoints.height/2 );
                
                mainArrow.isRotation0 = false;
                mainArrow2.isRotation0 = false;
                //Arrow1is0 = false;
                
                mainArrow2.rotation = 180;
                mainArrow.rotation = mainArrow2.rotation;
                Turn = false;
            }
            else{
                
                mainArrow2.position = ccp((self.contentSizeInPoints.width/2 - 70) + 35,self.contentSizeInPoints.height/2 );
                
                mainArrow.isRotation0 = true;
                mainArrow2.isRotation0 = true;
                //Arrow1is0 = true;
                
                mainArrow2.rotation = 0;
                mainArrow.rotation = mainArrow2.rotation;
                Turn = true;
            }
          }
    else{
        
            
            
            if (Turns) {
                
                mainArrow21.position = ccp((self.contentSizeInPoints.width/2 + 70) - 35,self.contentSizeInPoints.height/2 );
                
                
                mainArrow21.isRotation0 = false;
                mainArrow1.isRotation0 = false;
                //Arrow2is0 = false;
                
                mainArrow21.rotation = 180;
                mainArrow1.rotation = mainArrow21.rotation;
                Turns = false;
            }
            else{
                
                mainArrow21.position = ccp((self.contentSizeInPoints.width/2 + 70) + 35,self.contentSizeInPoints.height/2  );
                
                mainArrow21.isRotation0 = true;
                mainArrow1.isRotation0 = true;
                //Arrow2is0 = true;
                
                mainArrow21.rotation = 0;
                mainArrow1.rotation = mainArrow21.rotation;
                Turns = true;
            }
        
    }
    }

    

-(BOOL)isColorSame:(id)color{
    BOOL isSame = false;
    
    if ([color isEqual:chromaArrow.color]) {
        isSame = true;
        
    }
    
    return isSame;
}



-(void)update:(CCTime)delta{
   // runGame = YES;
    //waitTime = .3;
    //durationForSpeed = .5;
    if (score < 33){
    waitTime = 1.0 - (score * .015);
    durationForSpeed = 1.0 - (score * .015);
    }
    else if(score > 33 ){
        waitTime = .5;
        durationForSpeed = .5;
    }
    
    
   
   
 
  
}
    


@end

