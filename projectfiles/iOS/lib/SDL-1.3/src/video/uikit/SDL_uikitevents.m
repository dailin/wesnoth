/*
  Simple DirectMedia Layer
  Copyright (C) 1997-2012 Sam Lantinga <slouken@libsdl.org>

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
*/
#include "SDL_config.h"

#if SDL_VIDEO_DRIVER_UIKIT

#include "../../events/SDL_events_c.h"

#include "SDL_uikitvideo.h"
#include "SDL_uikitevents.h"

#import <Foundation/Foundation.h>
#include "jumphack.h"

static BOOL UIKit_EventPumpEnabled = YES;

void
SDL_iPhoneSetEventPump(SDL_bool enabled)
{
    UIKit_EventPumpEnabled = enabled;
}

void
UIKit_PumpEvents(_THIS)
{
    if (!UIKit_EventPumpEnabled)
        return;

    /*
        When the user presses the 'home' button on the iPod
        the application exits -- immediatly.

        Unlike in Mac OS X, it appears there is no way to cancel the termination.

        This doesn't give the SDL user's application time to respond to an SDL_Quit event.
        So what we do is that in the UIApplicationDelegate class (SDLUIApplicationDelegate),
        when the delegate receives the ApplicationWillTerminate message, we execute
        a longjmp statement to get back here, preventing an immediate exit.
     */
    if (setjmp(*jump_env()) == 0) {
        /* if we're setting the jump, rather than jumping back */
		
		/* Let the run loop run for a short amount of time: long enough for
		   touch events to get processed (which is important to get certain
		   elements of Game Center's GKLeaderboardViewController to respond
		   to touch input), but not long enough to introduce a significant
		   delay in the rest of the app.
		*/
		const CFTimeInterval seconds = 0;
		
		/* Pump most event types. */
        SInt32 result;
        do {
            result = CFRunLoopRunInMode(kCFRunLoopDefaultMode, seconds, TRUE);
        } while (result == kCFRunLoopRunHandledSource);
		
		/* Make sure UIScrollView objects scroll properly. */
		do {
			result = CFRunLoopRunInMode((CFStringRef)UITrackingRunLoopMode, seconds, TRUE);
		} while(result == kCFRunLoopRunHandledSource);
    }
}

#endif /* SDL_VIDEO_DRIVER_UIKIT */

/* vi: set ts=4 sw=4 expandtab: */
