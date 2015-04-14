#import "Fingerprints.h"
#import "iobegin.h"
/**
 * Actual implementation of the interface
 */
@implementation Fingerprints
- (void) iovation:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

     NSString* iovation = ioBegin();

     pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:iovation];
     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void) threatmetrix:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* orgId = [command.arguments objectAtIndex:0];
    NSString* sessionId = [command.arguments objectAtIndex:1];

    TrustDefenderMobile* profile = [[TrustDefenderMobile alloc]init];
    profile.sessionID = sessionId;
    [profile doProfileRequestFor:orgId];

     pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


@end
