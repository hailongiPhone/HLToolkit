//
//  UIView+HLToolkit.m
//  HLToolKit
//
//  Created by hailong on 2018/9/6.
//  Copyright © 2018年 HL. All rights reserved.
//

#import "UIView+HLToolkit.h"

@implementation UIView (HLToolkit)
- (void)setOrigin:(CGPoint)origin
{
    CGSize size = self.size;
    self.frame = CGRectMake(origin.x,
                            origin.y,
                            size.width,
                            size.height);
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setSize:(CGSize)size
{
    CGPoint origin = self.origin;
    self.frame = CGRectMake(origin.x,
                            origin.y,
                            size.width,
                            size.height);
}

- (CGSize)size
{
    return self.frame.size;
}

#pragma mark - Controllers

- (UIViewController *)viewController
{
    for (UIResponder * nextResponder = self.nextResponder;
         nextResponder;
         nextResponder = nextResponder.nextResponder)
    {
        if ([nextResponder isKindOfClass:[UIViewController class]])
            return (UIViewController *)nextResponder;
    }
    return nil;
}

- (UINavigationController *)navigationController
{
    return self.viewController.navigationController;
}

- (UITabBarController *)tabBarController
{
    return self.viewController.tabBarController;
}


#pragma mark - localizedxibview
-(NSString*)localizedValue:(NSString*)value
{
    if ([value hasPrefix:@"@"]) {
        value = NSLocalizedString([value substringFromIndex:1], nil);
    } else if ([value hasPrefix:@"\\@"]) {
        value = [value substringFromIndex:1];
    }
    return value;
}

-(void)localizeValueForKey:(NSString*)key
{
    NSString* oldValue = [self valueForKey:key];
    NSString* newValue = [self localizedValue:oldValue];
    
    if (oldValue != newValue) {
        [self setValue:newValue forKey:key];
    }
}

-(void)localizeButton
{
    UIButton* button = (id)self;
    for (int state = 0; state < 8; state++) {
        NSString* oldTitle = [button titleForState:state];
        if (oldTitle != nil) {
            NSString* newTitle = [self localizedValue:oldTitle];
            if (oldTitle != newTitle) {
                [button setTitle:newTitle forState:state];
            }
        }
    }
}

-(void)localizeSegmentedControl
{
    UISegmentedControl* castSC = (UISegmentedControl*) self;
    for (int index = 0; index < castSC.numberOfSegments; index++)
    {
        NSString* title = [castSC titleForSegmentAtIndex:index];
        [castSC setTitle:[self localizedValue:title] forSegmentAtIndex:index];
    }
}

-(void)localizeTabBar
{
    UITabBar* tabBar = (UITabBar*) self;
    
    NSArray* tabBarItems = tabBar.items;
    for (UITabBarItem* item in tabBarItems)
    {
        NSString* title = item.title;
        [item setTitle:[self localizedValue:title]];
    }
    
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    //NSLog("Class: %@", self.name);
    if ([self respondsToSelector:@selector(text)]) {
        [self localizeValueForKey:@"text"];
    } else if ([self respondsToSelector:@selector(title)]) {
        [self localizeValueForKey:@"title"];
    } else if ([self isKindOfClass:[UIButton class]]) {
        [self localizeButton];
    }
    else if ([self isKindOfClass:[UISegmentedControl class]]) {
        [self localizeSegmentedControl];
    }
    else if ([self isKindOfClass:[UITabBar class]])
    {
        [self localizeTabBar];
    }
    
    if ([self respondsToSelector:@selector(placeholder)]) {
        [self localizeValueForKey:@"placeholder"];
    }
}
@end
