//
//  RushTutorialScene.h
//  TwoArrows
//
//  Created by Nabhan maswood on 4/4/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "TwoArrowsMainScene.h"

@interface RushTutorialScene : TwoArrowsMainScene <CCPhysicsCollisionDelegate>{


    CCSprite *handSprite ;
    CCLabelTTF *scoreLabel2;
    CCLabelTTF *scoreLabel1;
    CCLabelTTF *but;
    BOOL fromOptions;

}

+(id) nodeInOptions;
-(id)initInOptions;


@end
