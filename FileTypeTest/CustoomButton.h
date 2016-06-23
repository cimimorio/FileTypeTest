//
//  CustoomButton.h
//  FileTypeTest
//
//  Created by apple on 16/6/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Cocoa/Cocoa.h>

IB_DESIGNABLE
@interface CustoomButton : NSControl

@property (nonatomic,strong) IBInspectable NSColor *backgroundColor;
@property (nonatomic,copy) IBInspectable NSString *textString;
@property (nonatomic,strong) IBInspectable NSImage *selectedImage;
@property (nonatomic,strong) IBInspectable NSImage *normalImage;
@property (nonatomic,assign) IBInspectable NSInteger state;


@end
