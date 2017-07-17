//
//  ExampleViewControllerImageView.m
//  MHVideoPhotoGallery
//
//  Created by Mario Hahn on 14.01.14.
//  Copyright (c) 2014 Mario Hahn. All rights reserved.
//

#import "ExampleViewControllerImageView.h"
#import "UIImageView+WebCache.h"

@interface ExampleViewControllerImageView ()
@end

@implementation ExampleViewControllerImageView

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"ImageView";
    
    
    MHGalleryItem *tailored = [[MHGalleryItem alloc]initWithURL:@"https://www.youtube.com/watch?v=fMQ6WuTcsLE"
                                                    galleryType:MHGalleryTypeVideo];
    
    MHGalleryItem *hannes = [[MHGalleryItem alloc]initWithURL:@"https://www.youtube.com/watch?v=fMQ6WuTcsLE"
                                                    galleryType:MHGalleryTypeVideo];

    
    NSArray *galleryItems = @[tailored,hannes];
    
    __weak ExampleViewControllerImageView *blockSelf = self;

    [self.iv setInseractiveGalleryPresentionWithItems:galleryItems currentImageIndex:0 currentViewController:self finishCallback:^(NSInteger currentIndex,UIImage *image,MHTransitionDismissMHGallery *interactiveTransition,MHGalleryViewMode viewMode) {
        if (viewMode == MHGalleryViewModeOverView) {
            [blockSelf dismissViewControllerAnimated:YES completion:nil];
        }else{
            blockSelf.iv.image = image;
            blockSelf.iv.currentImageIndex = currentIndex;
            [blockSelf.presentedViewController dismissViewControllerAnimated:YES dismissImageView:blockSelf.iv completion:nil];
        }
    }];
    
    
    [self.iv sd_setImageWithURL:[NSURL URLWithString:tailored.URLString]];
    [self.iv setUserInteractionEnabled:YES];
    
    self.iv.shoudlUsePanGestureReconizer = YES;
   
    
}



@end
