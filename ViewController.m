//
//  ViewController.m
//  PhotoDemo
//
//  Created by mac mini on 6/7/18.
//  Copyright © 2018年 何少博. All rights reserved.
//

#import "ViewController.h"
#import "HSBImagePickerController.h"
@interface ViewController ()

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

- (IBAction)photo:(id)sender {
    HSBImagePickerController * picker = [[HSBImagePickerController alloc]initWithColumnNumber:4 pickerType:(HSBImagePickerTypeImageAndVideo)];
    [self presentViewController:picker animated:YES completion:nil];
    
}

- (IBAction)video:(id)sender {
    
    
}


- (IBAction)photoVideo:(id)sender {
    
    
}

@end
