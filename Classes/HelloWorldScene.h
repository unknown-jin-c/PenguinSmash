//
//  HelloWorldLayer.h
//  Curling
//
//  Created by agnes on 11. 1. 15..
//  Copyright 우리집~ 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorld Layer
@interface HelloWorld : CCLayer
{
}

// returns a Scene that contains the HelloWorld as the only child
//+(void) scene;

-(void) nextCallback1: (id) sender;
-(void) nextCallback2: (id) sender;
@end
