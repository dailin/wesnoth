//
//  iOSPathManager.h
//  Wesnoth
//
//  Created by dai lin on 14/10/24.
//  Copyright (c) 2014年 dai lin. All rights reserved.
//

#ifndef __Wesnoth__iOSPathManager__
#define __Wesnoth__iOSPathManager__

#include <stdio.h>
#include <string>
using namespace std;

class iOSPathManager
{
public:
    static string getAppPath();
    static string getDocPath();
    static string getCachePath();
};
#endif /* defined(__Wesnoth__iOSPathManager__) */
