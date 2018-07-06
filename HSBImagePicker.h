//
//  HSBImagePicker.h
//  PhotoDemo
//
//  Created by mac mini on 6/7/18.
//  Copyright © 2018年 何少博. All rights reserved.
//

#ifndef HSBImagePicker_h
#define HSBImagePicker_h

#define iOS7Later ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f)
#define iOS8Later ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
#define iOS9Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)
#define iOS9_1Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.1f)
#define iOS11Later ([UIDevice currentDevice].systemVersion.floatValue >= 11.0f)

typedef NS_ENUM(NSInteger, HSBImagePickerType) {
    HSBImagePickerTypeImage,
    HSBImagePickerTypeVideo,
    HSBImagePickerTypeImageAndVideo
};


#endif /* HSBImagePicker_h */
