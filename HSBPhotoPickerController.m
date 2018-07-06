//
//  HSBPhotoPickerController.m
//  PhotoDemo
//
//  Created by mac mini on 6/7/18.
//  Copyright © 2018年 何少博. All rights reserved.
//

#import "HSBPhotoPickerController.h"
#import "HSBAssetModel.h"
#import "HSBPickerManager.h"
#import "HSBPhotoCell.h"


@interface HSBPhotoPickerController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) NSMutableArray *dataSource;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout *layout;

@property (strong, nonatomic) HSBPhotosModel *model;

@end

static CGFloat kItemMargin = 5;
static NSString *kCellID = @"HSBPhotoCell";

@implementation HSBPhotoPickerController

-(NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createCollectionView];
    [self fetchAssetModels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchAssetModels {
    __weak typeof(self) weakSelf = self;
    if (_pickerType == HSBImagePickerTypeImage) {
        [[HSBPickerManager manager] getAllImageAsset:^(HSBPhotosModel *photosModel) {
            weakSelf.model = photosModel;
            weakSelf.dataSource = [NSMutableArray arrayWithArray:photosModel.models];
            [weakSelf.collectionView reloadData];
        }];
    }else{
        [[HSBPickerManager manager] getAllVideoAsset:^(HSBPhotosModel *photosModel) {
            weakSelf.model = photosModel;
            weakSelf.dataSource = [NSMutableArray arrayWithArray:photosModel.models];
            [weakSelf.collectionView reloadData];
        }];
    }
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    _collectionView.frame = self.view.bounds;
    CGFloat itemWH = (self.view.bounds.size.width - (self.columnNumber + 1) * kItemMargin) / self.columnNumber;
    _layout.itemSize = CGSizeMake(itemWH, itemWH);
    _layout.minimumInteritemSpacing = kItemMargin;
    _layout.minimumLineSpacing = kItemMargin;
    [_collectionView setCollectionViewLayout:_layout];
    _collectionView.contentSize = CGSizeMake(self.view.bounds.size.width,
                                             ((_model.count + self.columnNumber - 1) / self.columnNumber) * self.view.bounds.size.width);
}

-(void)createCollectionView{
    _layout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.alwaysBounceHorizontal = NO;
    _collectionView.contentInset = UIEdgeInsetsMake(kItemMargin, kItemMargin, kItemMargin, kItemMargin);
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[HSBPhotoCell class] forCellWithReuseIdentifier:kCellID];
}
#pragma mark - UICollectionView dataSource  delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    HSBPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    HSBAssetModel * model = self.dataSource[indexPath.row];
    cell.model = model;
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  

    
}


@end
