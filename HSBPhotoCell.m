//
//  HSBPhotoCell.m
//  PhotoDemo
//
//  Created by mac mini on 6/7/18.
//  Copyright © 2018年 何少博. All rights reserved.
//

#import "HSBPhotoCell.h"
#import "HSBPickerManager.h"
#import "HSBAssetModel.h"
@interface HSBPhotoCell ()

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIView *bottomView;
@property (strong, nonatomic) UILabel *timeLengthLabel;
@property (strong, nonatomic) UIImageView *videoIv;

@end


@implementation HSBPhotoCell


- (void)setModel:(HSBAssetModel *)model {
    _model = model;
    [[HSBPickerManager manager] getPhotoWithAsset:model.asset photoWidth:self.bounds.size.width completion:^(UIImage *photo, NSDictionary *info) {
        self.imageView.image = photo;
    }];
    if (model.type == HSBAssetTypeImage) {
        self.bottomView.hidden = YES;
    }else{
        self.bottomView.hidden = NO;
        self.timeLengthLabel.text = model.timeLength;
    }
}

#pragma mark - Lazy load


- (UIImageView *)imageView {
    if (_imageView == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        [self.contentView addSubview:imageView];
        _imageView = imageView;
        [self.contentView bringSubviewToFront:_bottomView];
    }
    return _imageView;
}


- (UIView *)bottomView {
    if (_bottomView == nil) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
        [self.contentView addSubview:_bottomView];
    }
    return _bottomView;
}

- (UIImageView *)videoIv {
    if (_videoIv == nil) {
        _videoIv = [[UIImageView alloc] init];
        [_videoIv setImage:[UIImage imageNamed:@"VideoSendIcon"]];
        [self.bottomView addSubview:_videoIv];
    }
    return _videoIv;
}

- (UILabel *)timeLengthLabel {
    if (_timeLengthLabel == nil) {
        _timeLengthLabel = [[UILabel alloc] init];
        _timeLengthLabel.font = [UIFont boldSystemFontOfSize:11];
        _timeLengthLabel.textColor = [UIColor whiteColor];
        _timeLengthLabel.textAlignment = NSTextAlignmentRight;
        [self.bottomView addSubview:_timeLengthLabel];
    }
    return _timeLengthLabel;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat H = self.bounds.size.height;
    CGFloat W = self.bounds.size.width;
    self.imageView.frame = self.bounds;
   
    self.bottomView.frame = CGRectMake(0,  H - 17, W, 17);
    self.videoIv.frame = CGRectMake(8, 0, 17, 17);
    self.timeLengthLabel.frame = CGRectMake(17 + 8, 0, W - 17 - 8 - 5, 17);
}

@end
