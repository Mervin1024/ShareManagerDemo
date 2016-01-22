//
//  ViewController.m
//  ShareManagerDemo
//
//  Created by sh219 on 16/1/21.
//  Copyright © 2016年 sh219. All rights reserved.
//

#import "ViewController.h"
#import "ShareInfoView.h"

@interface ViewController () <ShareInfoDataSource>
@property (weak, nonatomic) IBOutlet UITextView *shareTextView;
- (IBAction)commitAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)commitAction:(id)sender {
//    NSLog(@"%@",self.shareTextView.text);
//    SharedTextObject *obj = [SharedTextObject shareTextObjectWithContent:self.shareTextView.text];
//    [[SharedManager manager] postShareInformation:obj toPlatform:SharedPlatformForSinaMicroblog];
    ShareInfoView *shareInfoView = [[ShareInfoView alloc] init];
    shareInfoView.dataSource = self;
    [shareInfoView showShareInfoViewInSuperView:self.view andViewController:self];
}

- (SharedObject *)sharedObject{
    return nil;
}
@end
