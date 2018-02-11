//
//  MindBendTutorialScene.m
//  TwoArrows
//
//  Created by Nabhan maswood on 4/4/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "MindBendTutorialScene.h"
#import "MindBendScene.h"
#import "MenuScene.h"

@interface MindBendTutorialScene(){

    
}

@end

@implementation MindBendTutorialScene
+(id) nodeInOptions
{
    
    return [[self alloc] initInOptions];
}


-(id)initInOptions{
    self = [super initInOptions];
   // physicsWorld.debugDraw = YES;
    randoSphereCount = 2;
    scoreLabel.string = @"Match the direction if the  ";
    scoreLabel1.string = @"arrows are the same color.";
    scoreLabel2.string = @"Otherwise, do the opposite.";
    [self addChild:scoreLabel2];
    but.string = @"MindBend";
   
    return self;
}


-(id)init{
    self = [super init];
    
   // physicsWorld.debugDraw = YES;
    randoSphereCount = 2;
    scoreLabel.string = @"Match the direction if the  ";
    scoreLabel1.string = @"arrows are the same color.";
    scoreLabel2.string = @"Otherwise, do the opposite.";
    [self addChild:scoreLabel2];
    but.string = @"MindBend";

    return self;}

-(void)playGame{
    if (!fromOptions) {
    id gameplayScene = [MindBendScene node];
    
    [[CCDirector sharedDirector] replaceScene:gameplayScene ];
    }
    else{
    id gameplayScene = [MenuScene node];
    
    [[CCDirector sharedDirector] replaceScene:gameplayScene ];
    
    }
}

-(BOOL)ccPhysicsCollisionPreSolve:(CCPhysicsCollisionPair *)pair label:(CCNodeColor *)nodeA ArrowFalls:(CCSprite *)nodeB{
    pair.friction = 0;
    return YES;
}

-(BOOL)ccPhysicsCollisionPreSolve:(CCPhysicsCollisionPair *)pair label:(CCNodeColor *)nodeA ArrowFall:(CCSprite *)nodeB{
     pair.friction = 0;
    return YES;
}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair label:(CCNodeColor *)node ArrowFalls:(CCSprite *)nodeB{
    node.position = ccp(0,self.contentSize.height/1.35 - 25);
    
    if (nodeB.position.x == (self.contentSizeInPoints.width/2 + 70) - 35 && [nodeB.color isEqual:col2]) {
        mainArrow21.position = ccp(nodeB.position.x, self.contentSizeInPoints.height/2);
        mainArrow21.rotation = 180;
    }
    else if (nodeB.position.x == (self.contentSizeInPoints.width/2 + 70) + 35 && [nodeB.color isEqual:col2]){
        
        mainArrow21.position = ccp(nodeB.position.x,self.contentSizeInPoints.height/2);
        mainArrow21.rotation = 0;
        
    }
    else if (nodeB.position.x == (self.contentSizeInPoints.width/2 + 70) - 35 && ![nodeB.color isEqual:col2]){
        mainArrow21.position = ccp((self.contentSizeInPoints.width/2 + 70) + 35,self.contentSizeInPoints.height/2);
        mainArrow21.rotation = 0;
    
    
    }
    else if (nodeB.position.x == (self.contentSizeInPoints.width/2 + 70) + 35 && ![nodeB.color isEqual:col2]){
        mainArrow21.position = ccp((self.contentSizeInPoints.width/2 + 70) - 35, self.contentSizeInPoints.height/2);
        mainArrow21.rotation = 180;
    
    }
    
    
    
    return YES;
    
}



-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair label:(CCNodeColor *)node ArrowFall:(CCSprite *)nodeB{
    
    
    node.position = ccp(0,self.contentSize.height/1.35 - 25);
    
    if (lround(nodeB.position.x) == (self.contentSizeInPoints.width/2 - 70) - 35 && [nodeB.color isEqual:col]) {
        mainArrow2.position = ccp(nodeB.position.x, self.contentSizeInPoints.height/2);
        ;
        mainArrow2.rotation = 180;
    }
    else if (nodeB.position.x == (self.contentSizeInPoints.width/2 - 70) + 35 && [nodeB.color isEqual:col]){
        mainArrow2.position = ccp(nodeB.position.x, self.contentSizeInPoints.height/2);
       mainArrow2.rotation = 0;
        
    }
    else if (lround(nodeB.position.x) == (self.contentSizeInPoints.width/2 - 70) - 35 && ![nodeB.color isEqual:col]){
        mainArrow2.position = ccp((self.contentSizeInPoints.width/2 - 70) + 35,self.contentSizeInPoints.height/2);
        mainArrow2.rotation = 0;
        
        
    }
    else if (nodeB.position.x == (self.contentSizeInPoints.width/2 - 70) + 35 && ![nodeB.color isEqual:col]){
        mainArrow2.position = ccp((self.contentSizeInPoints.width/2 - 70) - 35, self.contentSizeInPoints.height/2);
       mainArrow2.rotation = 180;
        
    }
    
    
    
    return YES;
    
}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair MainArrow:(CCSprite *)node ArrowFall:(CCSprite *)nodeB{
    
    
    [nodeB removeFromParent]; return YES;}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair MainArrow:(CCSprite *)node ArrowFalls:(CCSprite *)nodeB{
    
    
    [nodeB removeFromParent]; return YES;}

@end
