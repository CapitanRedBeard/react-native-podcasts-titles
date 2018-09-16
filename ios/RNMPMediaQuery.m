#import "RNMPMediaQuery.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation RNMPMediaQuery

+ (NSString *)getStatus
{
    int status = [MPMediaLibrary authorizationStatus];
  NSLog(@"!*!*! STATUS: %i, %i", status, MPMediaLibraryAuthorizationStatusAuthorized);
    switch (status) {
        case MPMediaLibraryAuthorizationStatusAuthorized:
            return @"authorized";
        case MPMediaLibraryAuthorizationStatusDenied:
            return @"denied";
        case MPMediaLibraryAuthorizationStatusRestricted:
            return @"restricted";
        default:
        NSLog(@"undetermined");
            return @"undetermined";
    }
}

+ (void)request:(void (^)(NSString *))completionHandler
{
    void (^handler)(void) =  ^(void) {
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler([self.class getStatus]);
        });
    };
    
    [MPMediaLibrary requestAuthorization:^(MPMediaLibraryAuthorizationStatus status){
        handler();
    }];
}
@end
