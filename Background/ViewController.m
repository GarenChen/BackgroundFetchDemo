//
//  ViewController.m
//  Background
//
//  Created by Garen on 2017/4/12.
//  Copyright © 2017年 cgc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.imageView.backgroundColor = [UIColor redColor];
	
//	[self fetchDataWithCompletionHandler:nil];
}


//测试后台获取
- (void)fetchDataWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		
		NSURL *url = [NSURL URLWithString:@"https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/TB1d.5eKFXXXXcOXpXXXXXXXXXX_!!0-item_pic.jpg_180x180.jpg"];
		
		NSData * data = [NSData dataWithContentsOfURL:url];
		
		UIImage *image = [UIImage imageWithData:data];
		
		if (image == nil) {
			if (completionHandler) {
				completionHandler(UIBackgroundFetchResultNoData);
			}
			return ;
		}
		
		dispatch_async(dispatch_get_main_queue(), ^{
			self.imageView.image = image;
			
			if (completionHandler) {
				completionHandler(UIBackgroundFetchResultNewData);
			}
			
		});
	});

}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
