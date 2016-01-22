//
//  SharedManager+QQ.m
//  ShareManagerDemo
//
//  Created by sh219 on 16/1/22.
//  Copyright © 2016年 sh219. All rights reserved.
//

#import "SharedManager+QQ.h"
#import "UserAlertViewManager.h"
static QQApiObject *QQ_obj = nil;
static QQSendScene QQ_scence;
@implementation SharedManager (QQ)
#pragma mark - TencentApiInterfaceDelegate

- (BOOL)onTencentReq:(TencentApiReq *)req{
    return YES;
}

- (BOOL)onTencentResp:(TencentApiResp *)resp{
    return YES;
}

- (void)tencentDidLogin{
    
}

- (void)tencentDidNotNetWork{
    
}

- (void)tencentDidNotLogin:(BOOL)cancelled{
    
}

#pragma mark - QQApiInterfaceDelegate

- (void)onReq:(QQBaseReq *)req{
    NSLog(@"req:%@",req);
}

- (void)onResp:(QQBaseResp *)resp{
    NSLog(@"resp:%@",resp);
}

- (void)isOnlineResponse:(NSDictionary *)response{
    NSLog(@"response:%@",response);
}

#pragma mark - QQ share
- (void)sharedToQQWithObject:(SharedObject *)sharedObj{
    [self sharedWithObject:sharedObj scene:SEND_TO_QQ];
}

- (void)sharedToQZoneWithObject:(SharedObject *)sharedObj{
    [self sharedWithObject:sharedObj scene:SEND_TO_QZONE];
}

- (void)sharedWithObject:(SharedObject *)sharedInfo scene:(QQSendScene)scene{
    switch (sharedInfo.purpose) {
        // 分享文字
        case ShareInfoPurposeForText:{
            [self sendReqToQQ:[QQApiTextObject objectWithText:sharedInfo.content] scene:scene];
            break;
        }
        // 分享本地图片
        case ShareInfoPurposeForImage:{
            QQApiImageObject *obj = [QQApiImageObject objectWithData:UIImageJPEGRepresentation(sharedInfo.image, 1.0) previewImageData:UIImageJPEGRepresentation(sharedInfo.previewImage, 1.0) title:sharedInfo.title description:sharedInfo.content];
            [self sendReqToQQ:obj scene:scene];
            break;
        }
        // 分享网络图片
        case ShareInfoPurposeForWebImage:{
            QQApiWebImageObject *obj = [QQApiWebImageObject objectWithPreviewImageURL:sharedInfo.shareUrl title:sharedInfo.title description:sharedInfo.content];
            [self sendReqToQQ:obj scene:scene];
            break;
        }
        // 分享URL内容
        default:{
            // URL目标类型
            QQApiURLTargetType type;
            if (ShareInfoPurposeForURLTargetTypeNotSpecified == sharedInfo.purpose) {
                type = QQApiURLTargetTypeNotSpecified;
            }else if (ShareInfoPurposeForURLTargetTypeNews == sharedInfo.purpose) {
                type = QQApiURLTargetTypeNews;
            }else if (ShareInfoPurposeForURLTargetTypeAudio == sharedInfo.purpose) {
                type = QQApiURLTargetTypeAudio;
            }else{
                type = QQApiURLTargetTypeVideo;
            }
            
            if (sharedInfo.previewImageURL) {
                // 网络缩略图
                QQApiURLObject *obj = [QQApiURLObject objectWithURL:sharedInfo.shareUrl title:sharedInfo.title description:sharedInfo.content previewImageURL:sharedInfo.previewImageURL targetContentType:type];
                [self sendReqToQQ:obj scene:scene];
            }else{
                // 本地缩略图
                QQApiURLObject *obj = [QQApiURLObject objectWithURL:sharedInfo.shareUrl title:sharedInfo.title description:sharedInfo.content previewImageData:UIImageJPEGRepresentation(sharedInfo.previewImage, 1.0) targetContentType:type];
                [self sendReqToQQ:obj scene:scene];
            }
            break;
        }
        
    }
}

- (void)sendReqToQQ:(QQApiObject *)qqApiObj scene:(QQSendScene)scene{
    if (![QQApiInterface isQQInstalled] || ![QQApiInterface isQQSupportApi]) {
        [UserAlertViewManager showAlertViewWithTitle:@"未安装QQ" message:@"请先安装QQ后分享" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil setCancelCallbackFunction:nil setOtherCallbackFunction:nil];
    }else {
        SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:qqApiObj];
        QQ_obj = qqApiObj;
        QQ_scence = scene;
        QQApiSendResultCode sent = 0;
        switch (scene) {
            case SEND_TO_QQ:
                sent = [QQApiInterface sendReq:req];
                break;
            case SEND_TO_QZONE:
                sent = [QQApiInterface SendReqToQZone:req];
                break;
            default:
                break;
        }
        [self handleSendResult:sent];
    }
}

- (void)handleSendResult:(QQApiSendResultCode)sendResult{
    switch (sendResult) {
        case EQQAPIAPPNOTREGISTED:
        {
            [UserAlertViewManager showAlertViewWithTitle:@"提示" message:@"您的App还未注册" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil setCancelCallbackFunction:nil setOtherCallbackFunction:nil];
            break;
        }
        case EQQAPIMESSAGECONTENTINVALID:
        {
            [UserAlertViewManager showAlertViewWithTitle:@"提示" message:@"发送的内容无效" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil setCancelCallbackFunction:nil setOtherCallbackFunction:nil];
            break;
        }
        case EQQAPIMESSAGECONTENTNULL:
        {
            [UserAlertViewManager showAlertViewWithTitle:@"提示" message:@"发送的内容不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil setCancelCallbackFunction:nil setOtherCallbackFunction:nil];
            break;
        }
        case EQQAPIMESSAGETYPEINVALID:
        {
            [UserAlertViewManager showAlertViewWithTitle:@"提示" message:@"发送的参数错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil setCancelCallbackFunction:nil setOtherCallbackFunction:nil];
            break;
        }
        case EQQAPIQQNOTINSTALLED:
        {
            [UserAlertViewManager showAlertViewWithTitle:@"提示" message:@"您还没有安装手机QQ" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil setCancelCallbackFunction:nil setOtherCallbackFunction:@"installQQApp"];
            break;
        }
        case EQQAPIQQNOTSUPPORTAPI:
        {
            [UserAlertViewManager showAlertViewWithTitle:@"提示" message:@"API接口不支持" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil setCancelCallbackFunction:nil setOtherCallbackFunction:nil];
            break;
        }
        case EQQAPISENDFAILD:
        {
            [UserAlertViewManager showAlertViewWithTitle:@"提示" message:@"发送失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"重新发送" setCancelCallbackFunction:nil setOtherCallbackFunction:@"resend"];
            break;
        }
        case EQQAPIQZONENOTSUPPORTTEXT:
        {
            [UserAlertViewManager showAlertViewWithTitle:@"提示" message:@"空间分享不支持纯文本分享，请使用图文分享" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil setCancelCallbackFunction:nil setOtherCallbackFunction:nil];
            break;
        }
        case EQQAPIQZONENOTSUPPORTIMAGE:
        {
            [UserAlertViewManager showAlertViewWithTitle:@"提示" message:@"空间分享不支持纯文本分享，请使用图文分享" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil setCancelCallbackFunction:nil setOtherCallbackFunction:nil];
            break;
        }
        default:
            break;
    }
}

- (void)installQQApp{
    
}

- (void)resend{
    if (!QQ_obj) {
        return;
    }
    [self sendReqToQQ:QQ_obj scene:QQ_scence];
}

@end
