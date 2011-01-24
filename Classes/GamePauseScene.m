//
//  GamePauseScene.m
//  Curling
//
//  Created by agnes on 11. 1. 19..
//  Copyright 2011 우리집~. All rights reserved.
//

#import "GamePauseScene.h"


@implementation GamePauseScene

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		
		// ask director the the window size
		//		CGSize size = [[CCDirector sharedDirector] winSize];
		
		// 		1번 방법
		
		//		CGRect rect;
		//		rect.size = size;
		//		rect.origin = CGPointZero;
		CCSprite *pBGSprite = [[CCSprite alloc] initWithFile:@"GameMain.png"];// rect:rect];
		
		// 2번 방법
		//		UIImage *image = [UIImage imageNamed:@"GameTitle.png"];
		//		UIImage *img = [Utility resizeImage:image width:size.width height:size.height];
		
		// 3번 방법
		//		UIImage *img = [[UIImage imageNamed:@"GameTitle.png"] _imageScaledToSize:CGSizeMake(size.width, size.height) interpolationQuality:1];
		//		CCSprite *pBGSprite = [[CCSprite alloc] spriteWithCGImage:[img CGImage]];
		[self addChild:pBGSprite];
		[pBGSprite release];
		//
		//		CCMenuItemImage *item1 = [CCMenuItemImage itemFromNormalImage:@"f1.png" selectedImage:@"f2.png" target:self selector:@selector(nextCallback1:)];
		//		CCMenuItemImage *item2 = [CCMenuItemImage itemFromNormalImage:@"f1.png" selectedImage:@"f2.png" target:self selector:@selector(nextCallback2:)];
		//		
		//		CCMenu *menu = [CCMenu menuWithItems:item1, item2, nil];
		//		
		//		menu.position = CGPointZero;
		//		item1.position = ccp( size.width/2 + 20,30);
		//		item2.position = ccp( size.width/2 + 100,30);
		//		[self addChild: menu z:1];			
		//		
	}
	return self;
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
