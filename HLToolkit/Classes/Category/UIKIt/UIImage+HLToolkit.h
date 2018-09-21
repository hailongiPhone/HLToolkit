//
//  UIImage+HLToolkit.h
//  HLToolKit
//
//  Created by hailong on 2018/9/6.
//  Copyright © 2018年 HL. All rights reserved.
//
@import UIKit;
#import <UIKit/UIKit.h>

@interface UIImage (HLToolkit)
/// @name Adjusting Orientation

/// Force an image to be orientated Up.
- (UIImage *)imageWithOrientationUp;

/// @name Resize and Cropping

/// Crop an image to a given area.
/// @param cropArea The reference area in image coordinates.
- (UIImage *)imageCroppedToRect:(CGRect)cropArea;

/// Downsize and crop an image in a way to **fill** a target pixel size.
/// @param size The target size in pixels.
/// @note The resulting image is downsized to fill and areas outside the target area are discarded.
- (UIImage *)imageCroppedToFill:(CGSize)size;

/// Downsize an image to **fill** a target pixel size.
/// @param size The target size in pixels.
/// @note The resulting image is not cropped.
- (UIImage *)imageDonwsizedToFill:(CGSize)size;

/// Downsize an image to **fit** a target pixel size.
/// @param size The target size in pixels.
/// @note The resulting image is not cropped.
- (UIImage *)imageDonwsizedToFit:(CGSize)size;

/// Downsize an image by a given factor.
/// @param factor The factor used to downsize where 1.0 is no downsize.
/// @note If factor is bigger or equal to 1.0 then the original image is returned.
- (UIImage *)imageDownsizedByFactor:(CGFloat)factor;

/// Flatten an image to make sure it has a CGImage backing.
- (UIImage *)imageFlattened;

/// Create and return a thumbanil image of a given size.
/// @param size The target size in points. Takea into account retina screens.
- (UIImage *)thumbnailWithSize:(CGSize)size;

/// @name Saving and Loading From Disk

/// Write image as JPEG with compression 0.8 to a given path.
/// @param path The complete target path including the desired file name and extension.
/// @return On success a valid NSURL or `nil` on failure.
- (NSURL *)writeToFile:(NSString *)path;

/// Write image to the temporary directory.
/// @return On success a valid NSURL or `nil` on failure.
- (NSURL *)writeToTemporaryDirectory;

/// Read an image from a given file NSURL.
/// @param fileURL A file NSURL.
+ (UIImage *)imageWithContentsOfFileURL:(NSURL *)fileURL;


- (UIImage *) imageWithTintColor:(UIColor *)tintColor;
- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;
+ (UIImage *) templateModeImageNamed:(NSString *)imageName;
- (UIColor *) mostColorScale:(float)scale;


//从颜色生成图片  默认size 1，1，用于平铺展示
+ (UIImage *)imageFromColor:(nullable UIColor *)color;

@end
