//
//  CustoomButton.m
//  FileTypeTest
//
//  Created by apple on 16/6/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CustoomButton.h"

@interface CustoomButton ()
{
	
}
@property (strong) NSTrackingArea *trackingArea;
@end

@implementation CustoomButton

-(instancetype)initWithFrame:(NSRect)frameRect{
	self = [super initWithFrame:frameRect];
	if (self) {
		[self setup];
	}
	return  self;
	
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self setup];
	}
	return self;
}


-(void)setup{
	self.backgroundColor = [NSColor redColor];
	self.textString = @"";
	self.selectedImage = [NSImage imageNamed:@"all_2"];
	self.normalImage = [NSImage imageNamed:@"all_1"];
	
	self.state = 0;
	self.trackingArea = [[NSTrackingArea alloc] initWithRect:self.bounds
													 options:NSTrackingActiveAlways | NSTrackingMouseEnteredAndExited
													   owner:self userInfo:nil];
	[self addTrackingArea:self.trackingArea];
}

-(void)setBackgroundColor:(NSColor *)backgroundColor{
	if (backgroundColor != _backgroundColor) {
		_backgroundColor = backgroundColor;
		self.needsDisplay = YES;
	}
}

- (void)drawRect:(NSRect)dirtyRect {
	[super drawRect:dirtyRect];
	
	// Drawing code here.
	NSRect rectFill = NSInsetRect(self.bounds, 3, 3);
	NSRect leftLine = NSMakeRect(0, 0, 5, self.bounds.size.height);
	NSBezierPath *bezier = [NSBezierPath bezierPathWithRect:leftLine];
	[self.backgroundColor setFill];
	[bezier fill];
	
	
}

@end
