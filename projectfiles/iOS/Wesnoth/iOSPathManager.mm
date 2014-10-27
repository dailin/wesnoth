//
//  iOSPathManager.cpp
//  Wesnoth
//
//  Created by dai lin on 14/10/24.
//  Copyright (c) 2014年 dai lin. All rights reserved.
//

#include "iOSPathManager.h"
#import <UIKit/UIKit.h>

string iOSPathManager::getAppPath()
{
    return [[[NSBundle mainBundle] resourcePath] UTF8String];
}

string iOSPathManager::getDocPath()
{
    NSArray *user_dir_paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *user_dir_documentsDirectory = [user_dir_paths objectAtIndex:0];
    return [user_dir_documentsDirectory UTF8String];
}

string iOSPathManager::getCachePath()
{
    NSArray *cache_dir_paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cache_dir_documentsDirectory = [cache_dir_paths objectAtIndex:0];
    return [cache_dir_documentsDirectory UTF8String];
}
