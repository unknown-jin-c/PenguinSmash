//
//  TitleScene.h
//  Curling
//
//  Created by agnes on 11. 1. 15..
//  Copyright 2011 우리집~. All rights reserved.
//

#import "cocos2d.h"
#import <Foundation/Foundation.h>


@interface TitleScene : CCLayer {
}

-(void) goGameScene: (id) sender;
-(void) goRankingScene: (id) sender;
-(void) goOptionScene: (id) sender;
-(void) goHelpScene: (id) sender;


@end
