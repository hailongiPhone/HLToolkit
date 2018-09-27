//
//  UIImage+HLToolkit.m
//  HLToolKit
//
//  Created by hailong on 2018/9/6.
//  Copyright © 2018年 HL. All rights reserved.
//

#import "UIImage+HLToolkit.h"
@import ImageIO;
@import MobileCoreServices;

@implementation UIImage (HLToolkit)
#pragma mark - Crop

- (UIImage *)imageCroppedToRect:(CGRect)cropArea
{
    cropArea = CGRectMake(nearbyintf(cropArea.origin.x),
                          nearbyintf(cropArea.origin.y),
                          nearbyintf(cropArea.size.width),
                          nearbyintf(cropArea.size.height));
    
    UIGraphicsBeginImageContextWithOptions(cropArea.size,
                                           YES,         // Opaque
                                           self.scale); // Use image scale
    
    [self drawInRect:CGRectMake(-cropArea.origin.x,
                                -cropArea.origin.y,
                                self.size.width,
                                self.size.height)];
    UIImage * croppedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return croppedImage;
}

- (UIImage *)imageCroppedToFill:(CGSize)size
{
    CGFloat factor = MAX(size.width / self.size.width,
                         size.height / self.size.height);
    
    UIGraphicsBeginImageContextWithOptions(size,
                                           YES,                     // Opaque
                                           self.scale);             // Use image scale
    
    CGRect rect = CGRectMake((size.width - nearbyintf(self.size.width * factor)) / 2.0,
                             (size.height - nearbyintf(self.size.height * factor)) / 2.0,
                             nearbyintf(self.size.width * factor),
                             nearbyintf(self.size.height * factor));
    [self drawInRect:rect];
    UIImage * croppedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    return croppedImage;
}

#pragma mark - Downsize

- (UIImage *)imageDonwsizedToFill:(CGSize)size
{
    return [self imageDownsizedByFactor:MAX(size.width / self.size.width,
                                            size.height / self.size.height)];
}

- (UIImage *)imageDonwsizedToFit:(CGSize)size
{
    return [self imageDownsizedByFactor:MIN(size.width / self.size.width,
                                            size.height / self.size.height)];
}

- (UIImage *)imageDownsizedByFactor:(CGFloat)factor
{
    // No need to downsize?
    if (factor >= 1.0)
        return self;
    
    // Downsize
    CGRect target = CGRectMake(0.0,
                               0.0,
                               nearbyintf(self.size.width * factor),
                               nearbyintf(self.size.height * factor));
    
    UIGraphicsBeginImageContextWithOptions(target.size,
                                           YES,         // Opaque
                                           self.scale); // Use image scale
    
    [self drawInRect:target];
    UIImage * downsizedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    return downsizedImage;
}

#pragma mark - Creating thumbnails

- (UIImage *)thumbnailWithSize:(CGSize)size
{
    // Manually set to double size for retina?
    CGFloat screenScale = [UIScreen mainScreen].scale;
    if (self.scale < screenScale)
    {
        size = CGSizeMake(size.width * screenScale,
                          size.height * screenScale);
    }
    
    return [self imageCroppedToFill:size];
}

#pragma mark - Flatten

- (UIImage *)imageFlattened
{
    UIGraphicsBeginImageContextWithOptions(self.size,
                                           YES,         // Opaque
                                           self.scale); // Use image scale
    
    [self drawInRect:CGRectMake(0.0,
                                0.0,
                                self.size.width,
                                self.size.height)];
    UIImage * flattenedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return flattenedImage;
}

#pragma mark - Save/load from Disk

- (NSURL *)writeToFile:(NSString *)filePath
{
    NSURL * url = [NSURL fileURLWithPath:filePath];
    CGImageDestinationRef destination = CGImageDestinationCreateWithURL((__bridge CFURLRef)url, kUTTypePNG, 1, NULL);
    if (!destination) {
        return nil;
    }

    CGImageDestinationAddImage(destination, self.CGImage, nil);
    CGImageDestinationFinalize(destination);
    CFRelease(destination);
    
    return url;
}

- (NSURL *)writeToTemporaryDirectory
{
    // Find a suitable path
    NSFileManager * manager = [NSFileManager new];
    NSString * directory = [NSTemporaryDirectory() stringByStandardizingPath];
    NSString * path;
    NSUInteger i = 1;
    do
    {
        path = [NSString stringWithFormat:@"%@/image%03ld.jpg", directory, (long)i++];
    }
    while ([manager fileExistsAtPath:path]);
    
    // Write it
    return [self writeToFile:path];
}

+ (UIImage *)imageWithContentsOfFileURL:(NSURL *)fileURL
{
    return [self imageWithContentsOfFile:fileURL.path];
}

// From: http://stackoverflow.com/questions/5427656/ios-uiimagepickercontroller-result-image-orientation-after-upload
- (UIImage *)imageWithOrientationUp
{
    // No-op if the orientation is already correct
    if (self.imageOrientation == UIImageOrientationUp) return self;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetColorSpace(self.CGImage),
                                             CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}


- (UIImage *) imageWithTintColor:(UIColor *)tintColor
{
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeDestinationIn];
}

- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor
{
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay];
}

- (UIImage *) imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode
{
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}

+ (UIImage *) templateModeImageNamed:(NSString *)imageName;
{
    return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

- (UIColor *) mostColorScale:(float)scale;
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
    if (scale <= 0.1) {
        scale = 0.1;
    }else if(scale >= 1){
        scale = 1;
    }
    
    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize=CGSizeMake([self size].width * scale, [self size].height * scale);
    //    CGSize thumbSize = CGSizeMake(50, 50);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 bitmapInfo);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, self.CGImage);
    CGColorSpaceRelease(colorSpace);
    
    
    
    //第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    
    if (data == NULL){
        CGContextRelease(context);
        return nil;
    }
    
    NSCountedSet *cls=[NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
    
    for (int x=0; x<thumbSize.width; x++) {
        for (int y=0; y<thumbSize.height; y++) {
            
            int offset = 4*(x*y);
            
            int red = data[offset];
            int green = data[offset+1];
            int blue = data[offset+2];
            int alpha =  data[offset+3];
            
            NSArray *clr=@[@(red),@(green),@(blue),@(alpha)];
            [cls addObject:clr];
            
        }
    }
    CGContextRelease(context);
    
    
    //第三步 找到出现次数最多的那个颜色
    NSEnumerator *enumerator = [cls objectEnumerator];
    NSArray *curColor = nil;
    
    NSArray *MaxColor=nil;
    NSUInteger MaxCount=0;
    
    while ( (curColor = [enumerator nextObject]) != nil )
    {
        NSUInteger tmpCount = [cls countForObject:curColor];
        
        if ( tmpCount < MaxCount ) continue;
        
        MaxCount=tmpCount;
        MaxColor=curColor;
        
    }
    //返回三原色色值
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
//    [dic setValue:@([MaxColor[0] intValue]/255.0f) forKey:@"red"];
//    [dic setValue:@([MaxColor[1] intValue]/255.0f) forKey:@"green"];
//    [dic setValue:@([MaxColor[2] intValue]/255.0f) forKey:@"blue"];
    
    return [UIColor colorWithRed:([MaxColor[0] intValue]/255.0f)
                           green:([MaxColor[1] intValue]/255.0f)
                            blue:([MaxColor[2] intValue]/255.0f)
                           alpha:([MaxColor[3] intValue]/255.0f)];
 
}

+ (UIImage *)imageFromColor:(nullable UIColor *)color;
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
