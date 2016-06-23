//
//  AppDelegate.m
//  FileTypeTest
//
//  Created by apple on 16/6/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "AppSandboxFileAccess.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application
	
	[self getAccess];
	

	
}

-(void)checkType{

	NSString *path = @"/Users/apple/Desktop/TEST/new/images/计划.numbers";
	NSFileManager *manager = [NSFileManager defaultManager];
	NSEnumerator *enumerator = [[manager subpathsAtPath:path] objectEnumerator];
	if ([manager fileExistsAtPath:path]) {
		NSLog(@"0000");
	}
	NSString* fileName;
	while ((fileName = [enumerator nextObject]) != nil){
		NSString* fileAbsolutePath = [path stringByAppendingPathComponent:fileName];
		
		NSData *data = [NSData dataWithContentsOfFile:fileAbsolutePath];
		
		if (data.length<2) {
			
			NSLog(@"%@,unknow",fileName);
			continue;
			
		}
		
		
		int char1 = 0 ,char2 =0 ; //必须这样初始化
		
		[data getBytes:&char1 range:NSMakeRange(0, 1)];
		
		[data getBytes:&char2 range:NSMakeRange(1, 1)];
		
		NSLog(@"%@,%d%d",fileName,char1,char2);
		
		NSString *numStr = [NSString stringWithFormat:@"%i%i",char1,char2];
		
		
		
	}
	
}

-(void)getAccess{
	AppSandboxFileAccess *fileAccess = [AppSandboxFileAccess fileAccess];
	__block AppDelegate *blockSelf = self;
	NSString *file = [self userPath];
	//	NSLog(@"%@",file);
	BOOL isDirectory = NO;
	BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:file isDirectory:&isDirectory];
	NSAssert(fileExists, @"File not found!");
	
	NSString *directory = (isDirectory) ? file : [file stringByDeletingLastPathComponent];
	//	__block __typeof(*&self)blockSelf = self;
	BOOL accessAllowed = [fileAccess accessFilePath:directory persistPermission:YES withBlock:^{
		//		[_manager checkSpace:nil];
				[blockSelf checkType];
	}];
	
	if (!accessAllowed) {
		NSLog(@"Sad Wookie");
	}
}

-(NSString*)userPath
{
	NSString* usersPath = [NSSearchPathForDirectoriesInDomains(NSUserDirectory, NSAllDomainsMask, YES) firstObject];
	return  [NSString stringWithFormat:@"%@/%@",usersPath,NSUserName()];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}

@end
