//
//  GameData.m
//  Curling
//
//  Created by agnes on 11. 1. 21..
//  Copyright 2011 우리집~. All rights reserved.
//

#import "GameData.h"


@implementation GameData

@synthesize fScaleSize;
static GameData * _sharedInstance = nil;


+(GameData *)sharedData
{
	@synchronized( [GameData class] )
	{
		if( !_sharedInstance )
			[[self alloc] init];
		
		return _sharedInstance;
	}
	return nil;
}

+(id)alloc
{
	@synchronized( [GameData class] )
	{
		_sharedInstance = [super alloc];
		return _sharedInstance;
	}
	
	return nil;
}

-(id)init
{
	self = [super init];
	
	if( self != nil )
	{
	}
	return self;
}

@end
