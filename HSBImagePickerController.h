//
//  HSBImagePickerController.h
//  PhotoDemo
//
//  Created by mac mini on 6/7/18.
//  Copyright © 2018年 何少博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSBImagePicker.h"

@interface HSBImagePickerController : UINavigationController

-(instancetype)initWithColumnNumber:(NSUInteger)cloumnNumber pickerType:(HSBImagePickerType) type;

@end
