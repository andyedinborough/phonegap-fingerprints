#ifdef CORDOVA_FRAMEWORK
#import <CORDOVA/CDVPlugin.h>
#else
#import "CORDOVA/CDVPlugin.h"
#endif

/**
 * Interface which does the actual handling
 */
@interface Fingerprints : CDVPlugin {
}
/**
 * Sets the idleTimerDisable property to true so that the idle timeout is disabled
 */
- (void) iovation:(CDVInvokedUrlCommand*)command;
- (void) threatmetrix:(CDVInvokedUrlCommand*)command;

@end
