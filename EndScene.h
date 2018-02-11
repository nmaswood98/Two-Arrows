//
//  EndScene.h
//  TwoArrows
//
//  Created by Nabhan maswood on 3/22/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "CCScene.h"

@interface EndScene : CCScene{
    
    CCNodeColor *background;
    NSString *lastGameScore;
    NSString *highScore;
    NSString *modeName;
    
    
}

-(void)setUpScene;
-(void)retryMethod;


@end
