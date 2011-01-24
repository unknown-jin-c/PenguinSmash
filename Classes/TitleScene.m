//
//  TitleScene.m
//  Curling
//
//  Created by agnes on 11. 1. 15..
//  Copyright 2011 우리집~. All rights reserved.
//

#import "TitleScene.h"
#import "SemiDirector.h"
#import "Utility.h"
#import "GameData.h"

@class GameData;
@implementation TitleScene

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
		
		CCSprite *pBGSprite = [[CCSprite alloc] initWithFile:@"GameTitle.png"];		
		
		// [TODO] 일단 background의 scale을 가져다가 쓰는 것으로 대체하자. 나중에 singleton try로써 처리.. 
		float fScaleValue = size.width / pBGSprite.contentSize.width;
		[pBGSprite setScale:fScaleValue];
		
		// position should be centered.
		pBGSprite.position = ccp(size.width/2, size.height/2);
		
//		self.fScaleImageSize = size.width / pBGSprite.contentSize.width;
		
//		[pBGSprite setScale:self.fScaleImageSize];
		
		/* Singleton Try */
//		[GameData sharedData].fScaleSize = size.width / pBGSprite.contentSize.width;
//		self.fScaleValue = size.width / pBGSprite.contentSize.width];
//		fScaleValue = size.width / pBGSprite.contentSize.width;
		
		[self addChild:pBGSprite];
		[pBGSprite release];

		
		[CCMenuItemFont setFontSize:30];
		[CCMenuItemFont setFontName: @"Courier New"];
//		[CCMenuItemFont setColor:ccc3(0, 0, 0)];
		
		CCMenuItem *pMenuGame = [[CCMenuItemFont alloc] initFromString: @"Game Start" target: self selector:@selector(goGameScene:)];
		CCMenuItem *pMenuOption = [[CCMenuItemFont alloc] initFromString: @"Option" target: self selector:@selector(goOptionScene:)];
		CCMenuItem *pMenuScores = [[CCMenuItemFont alloc] initFromString: @"Scores" target: self selector:@selector(goRankingScene:)];
		CCMenuItem *pMenuHelp = [[CCMenuItemFont alloc] initFromString: @"Help" target: self selector:@selector(goHelpScene:)];
		
		CCMenu *menu = [CCMenu menuWithItems:pMenuGame, pMenuOption, pMenuScores, pMenuHelp, nil];
		
		[menu alignItemsVertically];
		[self addChild: menu];
		
	}
	return self;
}

-(void) goGameScene: (id) sender
{
	[SemiDirector changeScene:@"GameScene"];
}
-(void) goRankingScene: (id) sender
{
	[SemiDirector changeScene:@"RankingScene"];
}
-(void) goHelpScene: (id) sender
{
	[SemiDirector changeScene:@"HelpScene"];
}
-(void) goOptionScene: (id) sender
{
	[SemiDirector changeScene:@"OptionScene"];
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
