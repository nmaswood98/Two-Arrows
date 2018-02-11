//
//  RushTutorialScene.m
//  TwoArrows
//
//  Created by Nabhan maswood on 4/4/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "RushTutorialScene.h"
#import "TwoArrowsMainScene.h"
#import "MindBendTutorialScene.h"

@interface RushTutorialScene(){
   
    
    BOOL rightTapped;
    BOOL leftTapped;
    
}
@end

@implementation RushTutorialScene
+(id) nodeInOptions
{
    
    return [[self alloc] initInOptions];
}
//-(id)init{
//    self = [super init];
//    
//        return self;}

-(id)init{
    self = [super init];
    fromOptions = NO;
    [self runGame];
    return self;
    
}

-(id)initInOptions{
    self = [super init];
    fromOptions = YES;
    [self runGame];
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
    //[self addChild:welcome];
    welcome.color = col;
    but = [CCLabelTTF labelWithString:@"Rush" fontName:@"LeoArrow-Regular" fontSize:40];
    but.position = ccp(self.contentSize.width/2,self.contentSize.height/1.15);
    but.color = col;
    [self addChild:but];
    
    //  background.position = ccp(self.contentSizeInPoints.width/2 ,0);
    
    scoreLabel = [CCLabelTTF labelWithString:@"Match the direction of" fontName:@"LeoArrow-Regular" fontSize:20 ];
    scoreLabel.position = ccp(self.contentSize.width/2,self.contentSize.height/1.35);
    scoreLabel.fontColor = [CCColor blackColor];
    [self addChild:scoreLabel];
   
    scoreLabel1 = [CCLabelTTF labelWithString:@"the same colored arrows." fontName:@"LeoArrow-Regular" fontSize:20 ];
    scoreLabel1.position = ccp(self.contentSize.width/2,self.contentSize.height/1.35 - 25);
    scoreLabel1.fontColor = [CCColor blackColor];
    
    
    
    
    CCNodeColor *hitLabel = [CCNodeColor nodeWithColor:[CCColor clearColor] width:320 height:scoreLabel.contentSize.height];
    hitLabel.physicsBody = [CCPhysicsBody bodyWithRect:(CGRect){ccp(0,0),hitLabel.contentSize}cornerRadius:0];
    hitLabel.physicsBody.collisionType = @"label";
    hitLabel.position = ccp(0,self.contentSize.height/1.35 - 25);
    
    
    [self addChild:scoreLabel1];
    [physicsWorld addChild:hitLabel];
    scoreLabel2 = [CCLabelTTF labelWithString:@"of the blue arrow." fontName:@"LeoArrow-Regular" fontSize:20 ];
    scoreLabel2.position = ccp(self.contentSize.width/2,self.contentSize.height/1.35 - 50);
    scoreLabel2.fontColor = [CCColor blackColor];
    //[self addChild:scoreLabel2];
    
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

-(void)runGame{
    [self schedule:@selector(startGame) interval:1 repeat:50 delay:1];
    NSInteger delayTime = 1;
    if(fromOptions){
        delayTime = 0;
    }
    [self schedule:@selector(buttonAppear) interval:1 repeat:0 delay:delayTime];
    
}

-(void)playGame{
    if (!fromOptions) {
    id gameplayScene = [TwoArrowsMainScene node];
    
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
    }
    else{
        id gameplayScene = [MindBendTutorialScene nodeInOptions];
        
        [[CCDirector sharedDirector] replaceScene:gameplayScene];
    
    }
}

-(void)buttonAppear{
     CCButton *okButton = [CCButton buttonWithTitle:@"Play" fontName:@"LeoArrow-Regular" fontSize:30];
    if (fromOptions) {
        okButton.title = @"Ok";
    }
   
    okButton.position = ccp(self.contentSize.width/2, self.contentSize.height/4);
    
    okButton.color = [CCColor blackColor];
    [okButton setTarget:self selector:@selector(playGame)];

    [self addChild:okButton];

}

-(void)startGame{
    if(runGame){
        ArrowFall = [ArrowSprite spriteWithImageNamed:@"Arrow2222.png"];
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
        
        
        
        
        
        
        
        
        
        ArrowFallz = [ArrowSprite spriteWithImageNamed:@"Arrow2222.png"];
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
        //[self scheduleOnce:@selector(startGame) delay:waitTime];
        //[NSTimer scheduledTimerWithTimeInterval:waitTime target:self selector:@selector(startGame) userInfo:nil repeats:NO];
    }
}



-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair label:(CCNodeColor *)node ArrowFalls:(CCSprite *)nodeB{

    node.position = ccp(0,self.contentSize.height/1.35 - 25);
    if (nodeB.position.x == (self.contentSizeInPoints.width/2 + 70) - 35 ) {
         mainArrow21.position = ccp(nodeB.position.x, self.contentSizeInPoints.height/2);
        mainArrow21.flipX = NO;
    }
   else if (nodeB.position.x == (self.contentSizeInPoints.width/2 + 70) + 35){
        mainArrow21.position = ccp(nodeB.position.x,self.contentSizeInPoints.height/2);
    mainArrow21.flipX = YES;
    
    }
   


    return YES;

}



-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair label:(CCNodeColor *)node ArrowFall:(CCSprite *)nodeB{
  
    
    node.position = ccp(0,self.contentSize.height/1.35 - 25);
    
    if (lround(nodeB.position.x) == (self.contentSizeInPoints.width/2 - 70) - 35) {
        mainArrow2.position = ccp(nodeB.position.x, self.contentSizeInPoints.height/2);
        mainArrow2.flipX = YES;
    }
    else if (nodeB.position.x == (self.contentSizeInPoints.width/2 - 70) + 35){
       mainArrow2.position = ccp(nodeB.position.x, self.contentSizeInPoints.height/2);
        mainArrow2.flipX = NO;
    
    }
    
    
    
    return YES;
    
}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair MainArrow:(CCSprite *)node ArrowFall:(CCSprite *)nodeB{[nodeB removeFromParent]; return YES;}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair MainArrow:(CCSprite *)node ArrowFalls:(CCSprite *)nodeB{[nodeB removeFromParent]; return YES;}


-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{


    

}

-(void)update:(CCTime)delta{

}

@end
