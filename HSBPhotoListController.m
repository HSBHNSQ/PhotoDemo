//
//  HSBPhotoListController.m
//  PhotoDemo
//
//  Created by mac mini on 6/7/18.
//  Copyright © 2018年 何少博. All rights reserved.
//

#import "HSBPhotoListController.h"
#import "HSBPhotoPickerController.h"

@interface HSBPhotoListController ()<UIScrollViewDelegate>

@property (strong, nonatomic) UISegmentedControl *titleSeg;

@property (strong, nonatomic) UIScrollView *scrollView;

@property (assign, nonatomic) BOOL hasClickSeg;

@end

@implementation HSBPhotoListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:NSLocalizedString(@"取消", @"取消") style:(UIBarButtonItemStylePlain) target:self action:@selector(cancelPicker)];
    self.view.backgroundColor =  [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self createView];
}



-(void)createView{
    
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    
    switch (_pickerType) {
        case HSBImagePickerTypeImageAndVideo:
            self.navigationItem.titleView = [self createTitleSeg];
            [self createPickerControllerVideoAndImage];
            break;
        case HSBImagePickerTypeImage:
            [self setNavTitle:NSLocalizedString(@"图片", @"图片")];
            [self createPickerController:HSBImagePickerTypeImage];
            break;
        case HSBImagePickerTypeVideo:
            [self setNavTitle:NSLocalizedString(@"视频", @"视频")];
            [self createPickerController:HSBImagePickerTypeVideo];
            break;
        default:
            break;
    }
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.scrollView.frame = self.view.bounds;
    for (NSInteger i = 0; i < self.childViewControllers.count; i ++) {
        UIViewController * vc = self.childViewControllers[i];
        CGRect frame =  self.scrollView.bounds;
        frame.origin.x = frame.size.width * i;
        vc.view.frame = frame;
    }
    self.scrollView.contentSize = CGSizeMake(self.childViewControllers.count * self.scrollView.bounds.size.width,
                                             self.scrollView.bounds.size.height);
    
}

-(void)createPickerControllerVideoAndImage{
    HSBPhotoPickerController * pickerVideo = [[HSBPhotoPickerController alloc]init];
    pickerVideo.pickerType = HSBImagePickerTypeVideo;
    pickerVideo.columnNumber = self.columnNumber;
    [self.scrollView addSubview:pickerVideo.view];
    [self addChildViewController:pickerVideo];
    
    HSBPhotoPickerController * pickerImage = [[HSBPhotoPickerController alloc]init];
    pickerImage.pickerType = HSBImagePickerTypeImage;
    pickerImage.columnNumber = self.columnNumber;
    [self.scrollView addSubview:pickerImage.view];
    [self addChildViewController:pickerImage];

    
    pickerVideo.view.backgroundColor = [UIColor redColor];
    pickerImage.view.backgroundColor = [UIColor orangeColor];
}

-(void)createPickerController:(HSBImagePickerType)pickerType{
    HSBPhotoPickerController * picker = [[HSBPhotoPickerController alloc]init];
    picker.columnNumber = self.columnNumber;
    picker.pickerType = pickerType;
    [self.scrollView addSubview:picker.view];
    [self addChildViewController:picker];
}


-(void)setNavTitle:(NSString *)title{
    NSDictionary * attr = @{
                            NSForegroundColorAttributeName:[UIColor blackColor],
                            NSFontAttributeName:[UIFont systemFontOfSize:17]
                            };
    self.navigationController.navigationBar.titleTextAttributes = attr;
    self.navigationItem.title = title;
}
-(UIView *)createTitleSeg{
    UIView * titleView = [[UIView alloc]init];
    titleView.backgroundColor = [UIColor clearColor];
    self.titleSeg = [[UISegmentedControl alloc]initWithItems:@[
                                                               NSLocalizedString(@"视频", @"视频"),
                                                               NSLocalizedString(@"图片", @"图片"),
                                                               ]];
    self.titleSeg.frame = CGRectMake(0, 0,150, 30);
    self.titleSeg.selectedSegmentIndex = 0;
    [self.titleSeg addTarget:self action:@selector(segChanged:) forControlEvents:(UIControlEventValueChanged)];
    [titleView addSubview:self.titleSeg];
    titleView.frame = CGRectMake(0, 0, 150, 30);
    return titleView;
}

-(void)segChanged:(UISegmentedControl *)seg{
    _hasClickSeg = YES;
    CGPoint point = CGPointMake(self.scrollView.bounds.size.width * seg.selectedSegmentIndex, 0);
    [self.scrollView setContentOffset:point animated:YES];
}

-(void)cancelPicker{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UIScrollView delegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.titleSeg) {
        NSInteger index = (scrollView.contentOffset.x + scrollView.bounds.size.width/2) / scrollView.bounds.size.width ;
        if (self.hasClickSeg) {
            if (self.titleSeg.selectedSegmentIndex == index) {
                self.hasClickSeg = NO;
            }
        }else{
            if (self.titleSeg.selectedSegmentIndex != index) {
                self.titleSeg.selectedSegmentIndex = index;
            }
        }
        
    }
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"%s",__FUNCTION__);
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"%s",__FUNCTION__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
