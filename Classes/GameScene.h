//
//  GameScene.h
//  Curling
//
//  Created by agnes on 11. 1. 15..
//  Copyright 2011 우리집~. All rights reserved.
//


#import "cocos2d.h"
#import "Box2D.h"

enum imageTag 
{
	tagMap, 
	tagPenguin
};

enum TouchStatus
{
	statusTouchPenguin = 1,
	statusTouchBackGround = 2,
	statusTouchMoveBG = 4
};
const static float GS_LINE_PERCENTAGE = 0.25;

@interface GameScene : CCLayer {
	b2World *_world;
	b2Body *_groundBody;
	b2Fixture *_bottomFixture;
	b2Fixture *_ballFixture;
	
	
	CCSprite *pBGSprite;
	CCSprite *pPenguin;
	
	int nTouchStatus;
	CGPoint touchStartPoint;
	
	float fGapBetweenImageNScr;
	
}

@end
