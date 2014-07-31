//
//  MLViewController.m
//  TestZBar
//
//  Created by dongway on 14-7-31.
//  Copyright (c) 2014年 dongway. All rights reserved.
//

#import "MLViewController.h"
#import "ZBarSDK.h"

@interface MLViewController ()
{
    ZBarReaderView *readerView;
}

@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)scanQRCode:(id)sender {
    
    readerView = [[ZBarReaderView alloc]init];
    readerView.frame = CGRectMake(10, 44, 300, 300);
    readerView.readerDelegate = self;
    //扫描区域
    CGRect scanMaskRect = CGRectMake(60, CGRectGetMidY(readerView.frame) - 126, 200, 200);
    //处理模拟器
    if (TARGET_IPHONE_SIMULATOR) {
        ZBarCameraSimulator *cameraSimulator
        = [[ZBarCameraSimulator alloc]initWithViewController:self];
        cameraSimulator.readerView = readerView;
    }
    [self.view addSubview:readerView];
    //扫描区域计算
    readerView.scanCrop = [self getScanCrop:scanMaskRect readerViewBounds:readerView.bounds];
    //调用ZBarReaderView的start方法开始扫描
    [readerView start];
    
}

-(CGRect)getScanCrop:(CGRect)rect readerViewBounds:(CGRect)readerViewBounds
{
    CGFloat x,y,width,height;
    
    x = rect.origin.x / readerViewBounds.size.width;
    y = rect.origin.y / readerViewBounds.size.height;
    width = rect.size.width / readerViewBounds.size.width;
    height = rect.size.height / readerViewBounds.size.height;
    
    return CGRectMake(x, y, width, height);
}

- (void) readerView: (ZBarReaderView*) readerView
     didReadSymbols: (ZBarSymbolSet*) symbols
          fromImage: (UIImage*) image{

    ZBarSymbol *s = nil;
    for (s in symbols){
        self.url.text = s.data;
        self.imageView.image = image;
        [readerView removeFromSuperview];
    }
}
@end










