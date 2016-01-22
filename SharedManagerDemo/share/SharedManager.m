//
//  ShareManager.m
//  ShareManagerDemo
//
//  Created by sh219 on 16/1/22.
//  Copyright © 2016年 sh219. All rights reserved.
//

#import "SharedManager.h"
#import "SharedManager+QQ.h"
#import "SharedManager+SinaWeibo.h"

static SharedManager *manager = Nil;
@implementation SharedManager

+ (instancetype)manager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [self init];
    });
    return manager;
}

- (instancetype)init{
    if ((self = [super init])) {
        userDefaults = [NSUserDefaults standardUserDefaults];
        oauth = [[TencentOAuth alloc] initWithAppId:__TencentQQAppId_ andDelegate:self];
        sinaWeibo = [[SinaWeibo alloc] initWithAppKey:__SinaWeiboAppKey_ appSecret:__SinaWeiboSecret_ appRedirectURI:__SinaWeiboRedirectUrl_ ssoCallbackScheme:[NSString stringWithFormat:@"wb%@",__SinaWeiboAppKey_] andDelegate:self];
        NSMutableDictionary *sinaWeiboAuthData = [userDefaults objectForKey:@"SinaWeiboAuthData"];
        sinaWeibo.accessToken = [sinaWeiboAuthData objectForKey:@"AccessTokenKey"];
        sinaWeibo.expirationDate = [sinaWeiboAuthData objectForKey:@"ExpirationDateKey"];
        sinaWeibo.userID = [sinaWeiboAuthData objectForKey:@"UserIDKey"];
        
        [YXApi registerApp:__YinXinAppKey_];
        
        [WXApi registerApp:__WeiXinAppKey_];
    }
    return self;
}

- (void)postShareInformation:(SharedObject *)sharedObject toPlatform:(SharedPlatform)platform{
    switch (platform) {
        case SharedPlatformForQQ:
            [self sharedToQQWithObject:sharedObject];
            break;
        case SharedPlatformForQZone:
            [self sharedToQZoneWithObject:sharedObject];
            break;
        case SharedPlatformForSinaMicroblog:
            [self sharedToSinaWeiboWithObject:sharedObject];
            break;
        case SharedPlatformForWeChat:
            
            break;
        case SharedPlatformForWechatCircles:
            
            break;
        case SharedPlatformForYiXin:
            
            break;
        case SharedPlatformForYiXinCircles:
            
            break;
        case SharedPlatformForTencentMicroblog:
            
            break;
    }
}

@end

@implementation SharedObject
- (instancetype)initSharedObjectWithPurpose:(ShareInfoPurpose)purpose
                                      title:(NSString *)title
                                    content:(NSString *)content
                                   shareURL:(NSURL *)url
                                      image:(UIImage *)image
                               previewImage:(UIImage *)previewImage
                            previewImageURL:(NSURL *)previewImageURL{
    if ((self = [super init])) {
        _purpose = purpose;
        _title = title;
        _content = content;
        _shareUrl = url;
        _image = image;
        _previewImage = previewImage;
        _previewImageURL = previewImageURL;
    }
    return self;
}

+ (instancetype)sharedObjectWithPurpose:(ShareInfoPurpose)purpose title:(NSString *)title content:(NSString *)content shareURL:(NSURL *)url image:(UIImage *)image previewImage:(UIImage *)previewImage previewImageURL:(NSURL *)previewImageURL{
    return [[SharedObject alloc] initSharedObjectWithPurpose:purpose title:title content:content shareURL:url image:image previewImage:previewImage previewImageURL:previewImageURL];
}
@end

@implementation SharedTextObject

+ (instancetype)shareTextObjectWithContent:(NSString *)text{
    return [super sharedObjectWithPurpose:ShareInfoPurposeForText title:nil content:text shareURL:nil image:nil previewImage:nil previewImageURL:nil];
}

@end

@implementation SharedImageObject

+ (instancetype)shareImageObjectWithTitle:(NSString *)title content:(NSString *)text image:(UIImage *)image previewImage:(UIImage *)previewImage{
    return [super sharedObjectWithPurpose:ShareInfoPurposeForImage title:title content:text shareURL:nil image:image previewImage:previewImage previewImageURL:nil];
}

@end

@implementation SharedWebImageObject

+ (instancetype)shareWebImageObjectWithTitle:(NSString *)title content:(NSString *)text imageURL:(NSURL *)shareUrl previewImageURL:(NSURL *)previewImageUrl{
    return [super sharedObjectWithPurpose:ShareInfoPurposeForWebImage title:title content:text shareURL:shareUrl image:nil previewImage:nil previewImageURL:previewImageUrl];
}

@end

@implementation SharedNewsObject

+ (instancetype)shareNewsObjectWithTitle:(NSString *)title content:(NSString *)text imageURL:(NSURL *)shareUrl previewImage:(UIImage *)previewImage{
    return [super sharedObjectWithPurpose:ShareInfoPurposeForURLTargetTypeNews title:title content:text shareURL:shareUrl image:nil previewImage:previewImage previewImageURL:nil];
}

+ (instancetype)shareNewsObjectWithTitle:(NSString *)title content:(NSString *)text imageURL:(NSURL *)shareUrl previewImageURL:(NSURL *)previewImageUrl{
    return [super sharedObjectWithPurpose:ShareInfoPurposeForURLTargetTypeNews title:title content:text shareURL:shareUrl image:nil previewImage:nil previewImageURL:previewImageUrl];
}

@end

@implementation SharedVideoObject

+ (instancetype)shareVideoObjectWithTitle:(NSString *)title content:(NSString *)text imageURL:(NSURL *)shareUrl previewImage:(UIImage *)previewImage{
    return [super sharedObjectWithPurpose:ShareInfoPurposeForURLTargetTypeVideo title:title content:text shareURL:shareUrl image:nil previewImage:previewImage previewImageURL:nil];
}

+ (instancetype)shareVideoObjectWithTitle:(NSString *)title content:(NSString *)text imageURL:(NSURL *)shareUrl previewImageURL:(NSURL *)previewImageUrl{
    return [super sharedObjectWithPurpose:ShareInfoPurposeForURLTargetTypeVideo title:title content:text shareURL:shareUrl image:nil previewImage:nil previewImageURL:previewImageUrl];
}

@end

@implementation SharedAudioObject

+ (instancetype)shareAudioObjectWithTitle:(NSString *)title content:(NSString *)text imageURL:(NSURL *)shareUrl previewImage:(UIImage *)previewImage{
    return [super sharedObjectWithPurpose:ShareInfoPurposeForURLTargetTypeAudio title:title content:text shareURL:shareUrl image:nil previewImage:previewImage previewImageURL:nil];
}

+ (instancetype)shareAudioObjectWithTitle:(NSString *)title content:(NSString *)text imageURL:(NSURL *)shareUrl previewImageURL:(NSURL *)previewImageUrl{
    return [super sharedObjectWithPurpose:ShareInfoPurposeForURLTargetTypeAudio title:title content:text shareURL:shareUrl image:nil previewImage:nil previewImageURL:previewImageUrl];
}

@end
