//
//  HSBImagePickerController.m
//  PhotoDemo
//
//  Created by mac mini on 6/7/18.
//  Copyright © 2018年 何少博. All rights reserved.
//
//

#import "HSBImagePickerController.h"
#import "HSBPhotoListController.h"
@interface HSBImagePickerController ()


@end

@implementation HSBImagePickerController


- (instancetype)initWithColumnNumber:(NSUInteger)columnNumber pickerType:(HSBImagePickerType)type{
    HSBPhotoListController * photoList = [[HSBPhotoListController alloc]init];
    photoList.columnNumber = columnNumber;
    photoList.pickerType = type;
    self = [super initWithRootViewController:photoList];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)createTopSen{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

@end
