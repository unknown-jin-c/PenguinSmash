//
//  HelloWorldLayer.m
//  Curling
//
//  Created by agnes on 11. 1. 15..
//  Copyright 우리집~ 2011. All rights reserved.
//

// Import the interfaces
#import "SemiDirector.h"
#import "HelloWorldScene.h"


// HelloWorld implementation
@implementation HelloWorld
//
//+(void) scene
//{
//	// 'scene' is an autorelease object.
//	//CCScene *scene = [CCScene node];
//	CCScene *scene = [[CCScene alloc] init];
//	
//	// 'layer' is an autorelease object.
//	HelloWorld *layer = [HelloWorld node];
//	
//	// add layer as a child to scene
//	[scene addChild: layer];
//	
//	[[CCDirector sharedDirector] runWithScene:scene];
//	[scene release];
//	// return the scene
//	//return scene;
//}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
		
		CCMenuItemImage *item1 = [CCMenuItemImage itemFromNormalImage:@"f1.png" selectedImage:@"f2.png" target:self selector:@selector(nextCallback1:)];
		CCMenuItemImage *item2 = [CCMenuItemImage itemFromNormalImage:@"f1.png" selectedImage:@"f2.png" target:self selector:@selector(nextCallback2:)];
		
		CCMenu *menu = [CCMenu menuWithItems:item1, item2, nil];
		
		menu.position = CGPointZero;
		item1.position = ccp( size.width/2 + 20,30);
		item2.position = ccp( size.width/2 + 100,30);
		[self addChild: menu z:1];			
		
	}
	return self;
}

-(void) nextCallback1: (id) sender
{
	//CCScene *s = [CCScene node];
//	[s addChild: [getMainScene() node]];
//	[[CCDirector sharedDirector] replaceScene: s];
	[SemiDirector changeScene:@"HelloWorldScene"];
}
-(void) nextCallback2: (id) sender
{
//	CCScene *s = [CCScene node];
//	[s addChild: [getRankingScene() node]];
//	[[CCDirector sharedDirector] replaceScene: s];
	[SemiDirector changeScene:@"GameScene"];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
