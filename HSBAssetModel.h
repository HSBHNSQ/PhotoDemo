//
//  HSBAssetModel.h
//  PhotoDemo
//
//  Created by mac mini on 6/7/18.
//  Copyright © 2018年 何少博. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PHAsset;
@class PHFetchResult;

typedef NS_ENUM(NSInteger ,HSBAssetType) {
    HSBAssetTypeImage,
    HSBAssetTypeVideo
};

@interface HSBAssetModel : NSObject

@property (nonatomic, strong) PHAsset *asset; 
@property (nonatomic, assign) HSBAssetType type;
@property (nonatomic, copy) NSString *timeLength;



@end

///
@interface HSBPhotosModel : NSObject

@property (assign, nonatomic) HSBAssetType assetType;
//
@property (strong, nonatomic) NSArray *models;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) PHFetchResult *result;

@end
