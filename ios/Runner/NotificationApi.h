// Autogenerated from Pigeon (v14.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import <Foundation/Foundation.h>

@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class NotificationMessage;

@interface NotificationMessage : NSObject
+ (instancetype)makeWithId:(nullable NSNumber *)id
    title:(nullable NSString *)title
    body:(nullable NSString *)body
    scheduleTime:(nullable NSNumber *)scheduleTime;
@property(nonatomic, strong, nullable) NSNumber * id;
@property(nonatomic, copy, nullable) NSString * title;
@property(nonatomic, copy, nullable) NSString * body;
@property(nonatomic, strong, nullable) NSNumber * scheduleTime;
@end

/// The codec used by NotificationApi.
NSObject<FlutterMessageCodec> *NotificationApiGetCodec(void);

@protocol NotificationApi
- (void)sendNotificationMessage:(NotificationMessage *)message error:(FlutterError *_Nullable *_Nonnull)error;
- (void)scheduleNotificationMessage:(NotificationMessage *)message error:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void SetUpNotificationApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<NotificationApi> *_Nullable api);

NS_ASSUME_NONNULL_END
