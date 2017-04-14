//
//  ViewController.h
//  Background
//
//  Created by Garen on 2017/4/12.
//  Copyright © 2017年 cgc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (void)fetchDataWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

@end

