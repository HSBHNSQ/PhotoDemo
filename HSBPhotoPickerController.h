//
//  HSBPhotoPickerController.h
//  PhotoDemo
//
//  Created by mac mini on 6/7/18.
//  Copyright © 2018年 何少博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSBImagePicker.h"

@interface HSBPhotoPickerController : UIViewController

@property (assign,nonatomic) NSUInteger columnNumber;

@property (assign,nonatomic) HSBImagePickerType pickerType;


@end
