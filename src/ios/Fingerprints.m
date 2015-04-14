#import "Fingerprints.h"
#import "iovation/iovation.h"
#import "TrustDefenderMobile/TrustDefenderMobile.h"
/**
 * Actual implementation of the interface
 */
@implementation Fingerprints
- (void) iovation:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* fingerprint = [iovation ioBegin];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:fingerprint];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void) threatmetrix:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* orgId = [command.arguments objectAtIndex:0];
    NSString* sessionId = [command.arguments objectAtIndex:1];

    TrustDefenderMobile* profile = nil;
    profile = [[TrustDefenderMobile alloc]init];
    profile.sessionID = sessionId;
    [profile doProfileRequestFor:orgId];

     pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


@end
