#import <Foundation/Foundation.h>

@interface RNMPMediaQuery : NSObject

+ (NSString *)getStatus;
+ (void)request:(void (^)(NSString *))completionHandler;

@end
