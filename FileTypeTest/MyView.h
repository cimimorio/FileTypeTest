//
//  MyView.h
//  FileTypeTest
//
//  Created by apple on 16/6/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AppKit/AppKit.h>
@interface MyView : NSView

@property (nonatomic,assign) NSInteger state;
@property (weak) IBOutlet NSTextField *leftMark;
@property (weak) IBOutlet NSImageView *image;
@property (weak) IBOutlet NSTextField *title;
@property (nonatomic,strong) NSImage *selectedImage;
@property (nonatomic,strong) NSImage *normalImage;

@end
