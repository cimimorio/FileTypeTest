//
//  MyView.m
//  FileTypeTest
//
//  Created by apple on 16/6/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MyView.h"

@interface MyView ()

@end

@implementation MyView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
	if (self.state == 0) {
		NSColor *fillColor = [NSColor blackColor];
		[fillColor set];
		NSRectFill([self bounds]);
	}else{
		NSColor *fillColor = [NSColor whiteColor];
		[fillColor setFill];
	}
	
}


-(NSImage *)selectedImage{
	if (!_selectedImage) {
		_selectedImage = [NSImage imageNamed:@"all_1"];
	}
	return _selectedImage;
}
-(NSImage *)normalImage{
	if (!_normalImage) {
		_normalImage = [NSImage imageNamed:@"all_2"];
	}
	return _normalImage;
}

-(void)setState:(NSInteger)state{
	if (state!=_state) {
		_state = state;
	}
	[self setUpWithState:state];
}

-(void)setUpWithState:(NSInteger)state{
	if (state == 0) {
		_leftMark.hidden = YES;
		[_image setImage:self.normalImage];
		[_title setTextColor:[NSColor blueColor]];
	}else{
		_leftMark.hidden = NO;
		[_image setImage:self.selectedImage];
		[_title setTextColor:[NSColor blackColor]];
	}
}

-(void)mouseDown:(NSEvent *)theEvent{
	if (_state == 0) {
		self.state = 1;
	}else{
		self.state = 0;
	}
	self.needsDisplay = YES;
	NSLog(@"%ld",(long)_state);
}

@end
