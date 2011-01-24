//
//  Utility.m
//  Curling
//
//  Created by agnes on 11. 1. 19..
//  Copyright 2011 우리집~. All rights reserved.
//

#import "Utility.h"


@implementation Utility
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
	UIGraphicsBeginImageContext( newSize );
	[image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return newImage;
}

+(UIImage*)imageByCropping:(UIImage *)imageToCrop toRect:(CGRect)rect
{
	UIGraphicsBeginImageContext(rect.size);
	CGContextRef currentContext = UIGraphicsGetCurrentContext();
	
	CGContextTranslateCTM(currentContext, 0.0, rect.size.height);
	CGContextScaleCTM(currentContext, 1.0, -1.0);	
	
	CGRect clippedRect = CGRectMake(0, 0, rect.size.width, rect.size.height);
	CGContextClipToRect( currentContext, clippedRect);
	CGRect drawRect = CGRectMake(rect.origin.x * -1,rect.origin.y * -1,imageToCrop.size.width,imageToCrop.size.height);
	CGContextDrawImage(currentContext, drawRect, imageToCrop.CGImage);
	CGContextScaleCTM(currentContext, 1.0, -1.0);
	
	UIImage *cropped = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return cropped;
}

@end
