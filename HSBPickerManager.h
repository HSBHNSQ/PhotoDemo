//
//  HSBPickerManager.h
//  PhotoDemo
//
//  Created by mac mini on 6/7/18.
//  Copyright © 2018年 何少博. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HSBPhotosModel;
@class PHAsset;
@interface HSBPickerManager : NSObject

+(instancetype)manager;

/// 获取所有图片
-(void)getAllImageAsset:(void(^)(HSBPhotosModel *photosModel)) completion;
/// 获取所有视频
-(void)getAllVideoAsset:(void(^)(HSBPhotosModel *photosModel)) completion;
/// 获取图片
- (void)getPhotoWithAsset:(PHAsset *)phAsset photoWidth:(CGFloat)photoWidth completion:(void (^)(UIImage *photo,NSDictionary *info))completion;
@end
