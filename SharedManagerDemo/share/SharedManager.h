//
//  ShareManager.h
//  ShareManagerDemo
//
//  Created by sh219 on 16/1/22.
//  Copyright © 2016年 sh219. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ENShareSDKManager.h"
// 分享平台
typedef NS_ENUM(NSInteger, SharedPlatform) {
    SharedPlatformForQQ,
    SharedPlatformForQZone,
    SharedPlatformForTencentMicroblog,
    SharedPlatformForSinaMicroblog,
    SharedPlatformForWeChat,
    SharedPlatformForWechatCircles,
    SharedPlatformForYiXin,
    SharedPlatformForYiXinCircles
};

#pragma mark - delegate

@class SharedManager;
@protocol SharedManagerDelegate <NSObject>
@optional
- (void)managerStartLoad:(SharedManager *)manager;
- (void)manager:(SharedManager *)manager dataLoadFinshed:(id)data;
- (void)manager:(SharedManager *)manager bindSuccess:(BOOL)resulte;

- (void)tencentWBShareSucceed;
- (void)tencentWBShareFailed;

- (void)sinaWBShareSucceed;
- (void)sinaWBShareFailed;

- (void)yixinShowOAuthView;
@end

#pragma mark - SharedManager

@class SharedObject;
@interface SharedManager : NSObject {
    NSUserDefaults *userDefaults;
    
    QQApiObject *qqApiObject;
    TencentOAuth *oauth;
    SinaWeibo *sinaWeibo;
    
    //temp
    NSString *tempToken;
    NSString *tempAccountId;
    
    BOOL isBindYiXinRequest;
    BOOL isSessionGetAccountBack;
}
@property (nonatomic, weak) id<SharedManagerDelegate> delegate;


+ (instancetype)manager;

- (void)postShareInformation:(SharedObject *)sharedObject toPlatform:(SharedPlatform)platform;
@end

#pragma mark - SharedObject

// 分享类型
typedef NS_ENUM(NSInteger, ShareInfoPurpose) {
    ShareInfoPurposeForText,
    ShareInfoPurposeForImage,
    ShareInfoPurposeForWebImage,
    ShareInfoPurposeForURLTargetTypeNotSpecified,
    ShareInfoPurposeForURLTargetTypeVideo,
    ShareInfoPurposeForURLTargetTypeAudio,
    ShareInfoPurposeForURLTargetTypeNews
};

@interface SharedObject : NSObject
// 分享的类型
@property (nonatomic, assign) ShareInfoPurpose purpose;
// 文字内容/描述
@property (nonatomic, copy) NSString *content;
// 标题
@property (nonatomic, copy) NSString *title;
// 分享URL对象
@property (nonatomic, strong) NSURL *shareUrl;
// 分享本地图片
@property (nonatomic, strong) UIImage *image;
// 本地预览图
@property (nonatomic, strong) UIImage *previewImage;
// 网络预览图
@property (nonatomic, strong) NSURL *previewImageURL;
- (instancetype)initSharedObjectWithPurpose:(ShareInfoPurpose)purpose
                                      title:(NSString *)title
                                    content:(NSString *)content
                                   shareURL:(NSURL *)url
                                      image:(UIImage *)image
                               previewImage:(UIImage *)previewImage
                            previewImageURL:(NSURL *)previewImageURL;
// 工厂方法
+ (instancetype)sharedObjectWithPurpose:(ShareInfoPurpose)purpose
                                  title:(NSString *)title
                                content:(NSString *)content
                               shareURL:(NSURL *)url
                                  image:(UIImage *)image
                           previewImage:(UIImage *)previewImage
                        previewImageURL:(NSURL *)previewImageURL;
@end
/** 分享文本
 @param content
 */
@interface SharedTextObject : SharedObject
+ (instancetype)shareTextObjectWithContent:(NSString *)text;
@end
/**
 分享本地图片
 @param title           标题
 @param content         描述
 @param image           本地图片
 @param previewImage    缩略图
 */
@interface SharedImageObject : SharedObject
+ (instancetype)shareImageObjectWithTitle:(NSString *)title content:(NSString *)text image:(UIImage *)image previewImage:(UIImage *)previewImage;
@end
/**
 分享网络图片
 @param title           标题
 @param content         描述
 @param shareUrl        图片url
 @param previewImageUrl 缩略图url
 */
@interface SharedWebImageObject : SharedObject
+ (instancetype)shareWebImageObjectWithTitle:(NSString *)title content:(NSString *)text imageURL:(NSURL *)shareUrl previewImageURL:(NSURL *)previewImageUrl;
@end
/**
 分享新闻链接
 @param title           标题
 @param content         描述
 @param shareUrl        新闻url
 @param previewImage    缩略图
 @param previewImageUrl 缩略图url
 */
@interface SharedNewsObject : SharedObject
+ (instancetype)shareNewsObjectWithTitle:(NSString *)title content:(NSString *)text imageURL:(NSURL *)shareUrl previewImageURL:(NSURL *)previewImageUrl;
+ (instancetype)shareNewsObjectWithTitle:(NSString *)title content:(NSString *)text imageURL:(NSURL *)shareUrl previewImage:(UIImage *)previewImage;
@end
/**
 分享视频
 @param title           标题
 @param content         描述
 @param shareUrl        视频url
 @param previewImage    缩略图
 @param previewImageUrl 缩略图url
 */
@interface SharedVideoObject : SharedObject
+ (instancetype)shareVideoObjectWithTitle:(NSString *)title content:(NSString *)text imageURL:(NSURL *)shareUrl previewImageURL:(NSURL *)previewImageUrl;
+ (instancetype)shareVideoObjectWithTitle:(NSString *)title content:(NSString *)text imageURL:(NSURL *)shareUrl previewImage:(UIImage *)previewImage;
@end
/**
 分享音频
 @param title           标题
 @param content         描述
 @param shareUrl        音频url
 @param previewImage    缩略图
 @param previewImageUrl 缩略图url
 */
@interface SharedAudioObject : SharedObject
+ (instancetype)shareAudioObjectWithTitle:(NSString *)title content:(NSString *)text imageURL:(NSURL *)shareUrl previewImageURL:(NSURL *)previewImageUrl;
+ (instancetype)shareAudioObjectWithTitle:(NSString *)title content:(NSString *)text imageURL:(NSURL *)shareUrl previewImage:(UIImage *)previewImage;
@end
