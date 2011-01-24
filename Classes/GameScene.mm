//
//  GameScene.m
//  Curling
//
//  Created by agnes on 11. 1. 15..
//  Copyright 2011 우리집~. All rights reserved.
//

#import "GameScene.h"
#import "Utility.h"

#define PTM_RATIO 32

@implementation GameScene

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
		self.isTouchEnabled = YES;
#endif
		CGSize size = [[CCDirector sharedDirector] winSize];
		float fScaleSize;
		
		// Create a world
		b2Vec2 gravity = b2Vec2(0.0f, 0.0f);
		bool doSleep = true;
		_world = new b2World(gravity, doSleep);
		
		// Create edges around the entire screen
		b2BodyDef groundBodyDef;
		groundBodyDef.position.Set(0,0);
		_groundBody = _world->CreateBody(&groundBodyDef);
		b2PolygonShape groundBox;
		b2FixtureDef groundBoxDef;
		groundBoxDef.shape = &groundBox;
		groundBox.SetAsEdge(b2Vec2(0,0), b2Vec2(size.width/PTM_RATIO, 0));
		_bottomFixture = _groundBody->CreateFixture(&groundBoxDef);
		groundBox.SetAsEdge(b2Vec2(0,0), b2Vec2(0, size.height/PTM_RATIO));
		_groundBody->CreateFixture(&groundBoxDef);
		groundBox.SetAsEdge(b2Vec2(0, size.height/PTM_RATIO), b2Vec2(size.width/PTM_RATIO, 
																		size.height/PTM_RATIO));
		_groundBody->CreateFixture(&groundBoxDef);
		groundBox.SetAsEdge(b2Vec2(size.width/PTM_RATIO, size.height/PTM_RATIO), 
							b2Vec2(size.width/PTM_RATIO, 0));
		_groundBody->CreateFixture(&groundBoxDef);
		
		
	
		// Set Background Image
		pBGSprite = [[CCSprite alloc] initWithFile:@"GameMain.png"];
		fScaleSize = size.width / pBGSprite.contentSize.width;
		[pBGSprite setScale:fScaleSize];
		
		// height should be center - ((ContentSize.height - ScreenSize.height)/2)
		fGapBetweenImageNScr = (pBGSprite.contentSize.height*pBGSprite.scale - size.height)/2.0f;
		pBGSprite.position = ccp(size.width/2, size.height/2 + fGapBetweenImageNScr);
		
		// Set Penguin Image
		pPenguin = [[CCSprite alloc] initWithFile:@"Penguin.png"];
//		fScaleSize = size.width / pPenguin.contentSize.width;
		[pPenguin setScale:fScaleSize];
		
		pPenguin.position = ccp(size.width/2, -(pPenguin.contentSize.height*pPenguin.scale/2.0f));		
		
		[self addChild:pBGSprite z:-1 tag:tagMap];
		[self addChild:pPenguin z:0 tag:tagPenguin];
		
#if 0
		// Create ball body 
		b2BodyDef penguinBodyDef;
		penguinBodyDef.type = b2_dynamicBody;
		penguinBodyDef.position.Set(100/PTM_RATIO, 100/PTM_RATIO);
		penguinBodyDef.userData = ball;
		b2Body * ballBody = _world->CreateBody(&ballBodyDef);
		
		// Create circle shape
		b2CircleShape circle;
		circle.m_radius = 26.0/PTM_RATIO;
		
		// Create shape definition and add to body
		b2FixtureDef ballShapeDef;
		ballShapeDef.shape = &circle;
		ballShapeDef.density = 1.0f;
		ballShapeDef.friction = 0.f;
		ballShapeDef.restitution = 1.0f;
		_ballFixture = ballBody->CreateFixture(&ballShapeDef);
#endif	
		// actions
		id bgMoveUp = [CCMoveBy actionWithDuration:2 position:ccp(0,fGapBetweenImageNScr*-2)];
		id bgMoveDown = [bgMoveUp reverse];
		id pgAppear = [CCCallFuncN actionWithTarget:self selector:@selector(penguinAppear:)];
		
		id seq = [CCSequence actions: bgMoveUp, bgMoveDown, pgAppear, nil];
		[[CCActionManager sharedManager] addAction:seq target:pBGSprite paused:NO];
		
		[pBGSprite release];	
		[pPenguin release];
	}
	
	return self;
	
}

-(void) penguinAppear:(id)sender
{
	CGSize size = [[CCDirector sharedDirector] winSize];
	id goPenguinUp = [CCMoveTo actionWithDuration:2 position:ccp(size.width/2, pPenguin.contentSize.height*pPenguin.scale/2.0f /* *화면 percentage*/ )];

	[pPenguin runAction:goPenguinUp];
	
}


-(void) registerWithTouchDispatcher
{
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	//prevent from double touching
	if( !nTouchStatus )
	{
		CGPoint touchLocation = [touch locationInView: [touch view]];	
		touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];

		touchStartPoint = touchLocation;
	
		if( touchLocation.y <= 30 + self.position.y )
		{
			nTouchStatus = statusTouchPenguin;
			// add Penguin Move Event
		}else
			nTouchStatus = statusTouchBackGround;
	}
	return YES;
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
	if(( nTouchStatus & statusTouchMoveBG ))
	{
		// do nothing
	}else if (nTouchStatus & statusTouchPenguin )
	{
		// penguin Move
	}else {
		[self setPosition:ccp( self.position.x, 0.0f)];
	}
	
	nTouchStatus = 0;

}

-(void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint touchLocation = [touch locationInView: [touch view]];		
	touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
	
//	CGSize size = [[CCDirector sharedDirector] winSize];

	CGPoint currentPos;
	
	CCNode *node;
	
	if( nTouchStatus == statusTouchPenguin ) { 
		node = [self getChildByTag:tagPenguin];
		
		[node setPosition:touchLocation];
		// add exception disposal that the penguin can't get out from screen.
		if( node.position.y < 0 )
			node.position = ccp(node.position.x, 0);
		else if( node.position.y < 30 )
			node.position = ccp(node.position.x, 30);

	} else {
		
		nTouchStatus |= statusTouchMoveBG;

		currentPos = [self position];
		[self setPosition: ccp(currentPos.x, currentPos.y + (touchLocation.y - touchStartPoint.y))];
		
		if( self.position.y > 0 )
			self.position = ccp(self.position.x,0);
		else if( self.position.y < -2*fGapBetweenImageNScr)
			self.position = ccp(self.position.x,-2*fGapBetweenImageNScr);
			
		
		touchStartPoint = touchLocation;
		
	}
	
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	delete _world;
	_world = NULL;
	[super dealloc];
}

@end
