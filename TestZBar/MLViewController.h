//
//  MLViewController.h
//  TestZBar
//
//  Created by dongway on 14-7-31.
//  Copyright (c) 2014年 dongway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"
@interface MLViewController : UIViewController<ZBarReaderViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *url;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
