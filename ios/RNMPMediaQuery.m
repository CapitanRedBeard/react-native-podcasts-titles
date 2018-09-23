#import "RNMPMediaQuery.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation RNMPMediaQuery

+ (NSString *)getStatus
{

   int status = [MPMediaLibrary authorizationStatus];
  
  NSLog(@"!*!*! Status: %p",  status);

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

+ (NSArray *)requestPodcastTitles
{
//    MPMediaQuery *everything = [[MPMediaQuery alloc] init];
//    [everything setGroupingType: MPMediaGroupingPodcastTitle];
//    NSArray *collections = [everything collections];
//
  
//  MPMediaQuery *mediaQuery = [MPMediaQuery podcastsQuery];
//  NSArray *mediaCollections = [mediaQuery collections];
//  NSLog(@"Collections: %@", mediaCollections);
//  NSLog(@"collection class %@", [mediaCollections class]);
//
//  NSMutableArray *mutablePodcastsToSerialize = [NSMutableArray array];
//
//  for (MPMediaItem *podcast in mediaCollections){
//    NSLog(@"podcast class %@", [podcast class]);
//
//    NSString *podcastTitle = [podcast valueForProperty: MPMediaItemPropertyPodcastTitle];
//    NSLog(@"Podcast Title!: %s", podcastTitle);
//
//    NSDictionary *podcastDictionary = @{@"podcastTitle": podcastTitle};
//    [mutablePodcastsToSerialize addObject:podcastDictionary];
//  }
//    return mutablePodcastsToSerialize;

  MPMediaQuery *query = [[MPMediaQuery alloc] init];
  [query setGroupingType: MPMediaGroupingPodcastTitle];
  NSArray *podcasts = [query collections];
  NSMutableArray *mutablePodcastsToSerialize = [NSMutableArray array];

  for (MPMediaItemCollection *podcast in podcasts) {
    MPMediaItem *representativeItem = [podcast representativeItem];
    NSString *podcastTitle =
    [representativeItem valueForProperty: MPMediaItemPropertyPodcastTitle];\
    NSLog (@" Podcast Title: %@", podcastTitle);
    NSDictionary *podcastDictionary = @{@"podcastTitle": podcastTitle};
    [mutablePodcastsToSerialize addObject:podcastDictionary];

  }
  return mutablePodcastsToSerialize;
  
//
//  NSData *jsonRepresentation = [NSJSONSerialization dataWithJSONObject:mutablePodcastsToSerialize options:0 error:NULL];
//
//    NSString *jsonStringCollections = [[NSString alloc] initWithData:jsonRepresentation encoding:NSUTF8StringEncoding];
//
//    NSLog(@"!*!*! jsonStringCollections: %@", jsonStringCollections);
//    return jsonStringCollections;

}
@end
