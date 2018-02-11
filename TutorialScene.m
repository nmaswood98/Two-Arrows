//
//  TutorialScene.m
//  TwoArrows
//
//  Created by Nabhan maswood on 4/3/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "TutorialScene.h"
#import "RushTutorialScene.h"
#import "CCAnimation.h"
#import "MenuScene.h"


@interface TutorialScene(){
    CCSprite *handSprite ;
    CCLabelTTF *scoreLabel2;
    CCLabelTTF *scoreLabel1;
    CCLabelTTF *but;
    
    BOOL rightTapped;
    BOOL leftTapped;
    BOOL fromOptions;
}
@end

@implementation TutorialScene


+(id) nodeInOptions
{
    
    return [[self alloc] initInOptions];
}




-(id)init{
  self = [super init];
    rightTapped = YES;
    leftTapped  = NO;
  
    
    handSprite = [CCSprite spriteWithImageNamed:@"Hand.jpg"];
    handSprite.position = ccp(self.contentSize.width/3, self.contentSize.height/3);
    handSprite.scale = .6;
    [self addChild:handSprite];
    fromOptions = NO;

    return self;
}

-(id)initInOptions{
    self = [self init];
    
    fromOptions = YES;

    return self;
}

-(void)settss{
    
   
    
    background = [CCNodeColor nodeWithColor:[CCColor whiteColor]];
    [self addChild:background];
    self.anchorPoint = ccp(0, 0);
    physicsWorld = [CCPhysicsNode node];
    physicsWorld.gravity = ccp(0,0);
    // physicsWorld.debugDraw = YES;
    physicsWorld.collisionDelegate = self;
    [self addChild:physicsWorld];
    [self setIntialValues];
    CCLabelTTF *welcome = [CCLabelTTF labelWithString:@"Welcome to" fontName:@"LeoArrow-Regular" fontSize:30];
    welcome.position = ccp(self.contentSize.width/2,self.contentSize.height/1.15 + 35);
    [self addChild:welcome];
    welcome.color = col;
    but = [CCLabelTTF labelWithString:@"Two Arrows" fontName:@"LeoArrow-Regular" fontSize:40];
    but.position = ccp(self.contentSize.width/2,self.contentSize.height/1.15);
    but.color = col;
    [self addChild:but];

    //  background.position = ccp(self.contentSizeInPoints.width/2 ,0);
    
    scoreLabel = [CCLabelTTF labelWithString:@"Tap on the left to " fontName:@"LeoArrow-Regular" fontSize:20 ];
    scoreLabel.position = ccp(self.contentSize.width/2,self.contentSize.height/1.35);
    scoreLabel.fontColor = [CCColor blackColor];
    [self addChild:scoreLabel];
    
   scoreLabel1 = [CCLabelTTF labelWithString:@"change the direction" fontName:@"LeoArrow-Regular" fontSize:20 ];
    scoreLabel1.position = ccp(self.contentSize.width/2,self.contentSize.height/1.35 - 25);
    scoreLabel1.fontColor = [CCColor blackColor];
    [self addChild:scoreLabel1];
    scoreLabel2 = [CCLabelTTF labelWithString:@"of the blue arrow." fontName:@"LeoArrow-Regular" fontSize:20 ];
    scoreLabel2.position = ccp(self.contentSize.width/2,self.contentSize.height/1.35 - 50);
    scoreLabel2.fontColor = [CCColor blackColor];
    [self addChild:scoreLabel2];
    
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
    
    
       //[NSTimer scheduledTimerWithTimeInterval:waitTime target:self selector:@selector(startGame) userInfo:nil repeats:NO];
    
    
    
}
-(void)goToMenu{
    if (!fromOptions) {
       
        id gameplayScene = [MenuScene node];
        CCTransition *transition = [CCTransition transitionCrossFadeWithDuration:.5];
        [[CCDirector sharedDirector] replaceScene:gameplayScene withTransition:transition];
    }
    else{
    
        id gameplayScene = [RushTutorialScene nodeInOptions];
       
        [[CCDirector sharedDirector] replaceScene:gameplayScene ];
    
    }

}

-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
   
    
    
    if (touch.locationInWorld.x < self.contentSizeInPoints.width/2) {
        if(rightTapped){
        CCActionCallBlock *firBlck = [CCActionCallBlock actionWithBlock:^(void){
        [scoreLabel runAction:[CCActionFadeOut actionWithDuration:.5]];
        [scoreLabel2 runAction:[CCActionFadeOut actionWithDuration:.5]];
        [scoreLabel1 runAction:[CCActionFadeOut actionWithDuration:.5]];
           
        }];
        CCActionCallBlock *firBlck2 = [CCActionCallBlock actionWithBlock:^(void){
            scoreLabel.string = @"Tap on the right to";
            scoreLabel2.string = @"of the black arrow.";
            [handSprite runAction:[CCActionMoveTo actionWithDuration:.5 position:ccp(self.contentSize.width/1.3, self.contentSize.height/3)]];
            [scoreLabel runAction:[CCActionFadeIn actionWithDuration:.5]];
            [scoreLabel2 runAction:[CCActionFadeIn actionWithDuration:.5]];
            [scoreLabel1 runAction:[CCActionFadeIn actionWithDuration:.5]];
            
        }];
        CCActionDelay *del = [CCActionDelay actionWithDuration:.5];
        [self runAction:[CCActionSequence actionWithArray:@[firBlck,del,firBlck2]]];
            rightTapped = NO;
            leftTapped = YES;
        }
       // [scoreLabel2 runAction:[CCActionFadeOut actionWithDuration:1]];
       // scoreLabel2.string = @"of the black arrow.";
        
        
        
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
        if (leftTapped) {
            CCButton *okButton = [CCButton buttonWithTitle:@"Ok" fontName:@"LeoArrow-Regular" fontSize:30];
            okButton.position = ccp(self.contentSize.width/2, self.contentSize.height/4);
            
            okButton.color = [CCColor blackColor];
            [okButton setTarget:self selector:@selector(goToMenu)];
           
            CCActionDelay *del = [CCActionDelay actionWithDuration:1];
            CCActionCallBlock * cel = [CCActionCallBlock actionWithBlock:^(void){
               [self addChild:okButton];
            
            }];
             [self runAction:[CCActionSequence actionWithArray:@[del,cel]]];
            leftTapped = NO;
        }
     
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


@end
