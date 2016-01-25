//
//  SharedManager+SinaWeiBo.m
//  SharedManagerDemo
//
//  Created by sh219 on 16/1/22.
//  Copyright © 2016年 sh219. All rights reserved.
//

#import "SharedManager+SinaWeibo.h"

@implementation SharedManager (SinaWeibo)
#pragma mark SinaWeiboDelegate

- (void)sinaweiboDidLogIn:(SinaWeibo *)sinaweibo{
    NSMutableDictionary *sinaWeiboAuthData = [NSMutableDictionary dictionary];
    [sinaWeiboAuthData setObject:sinaWeibo.accessToken forKey:@"AccessTokenKey"];
    [sinaWeiboAuthData setObject:sinaWeibo.expirationDate forKey:@"ExpirationDateKey"];
    [sinaWeiboAuthData setObject:sinaWeibo.userID forKey:@"UserIDKey"];
    [userDefaults setObject:sinaWeiboAuthData forKey:@"SinaWeiboAuthData"];
    [userDefaults synchronize];
//    [SVProgressHUD showSuccessWithStatus:@"授权成功"];
    NSLog(@"%@",@"授权成功");
}

#pragma mark SinaWeiboRequestDelegate

- (void)request:(SinaWeiboRequest *)request didReceiveResponse:(NSURLResponse *)response{
    if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
        NSHTTPURLResponse * httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode == 200) {
            if ([self.delegate respondsToSelector:@selector(sinaWBShareSucceed)]) {
                [self.delegate sinaWBShareSucceed];
            }
        }else{
            if ([self.delegate respondsToSelector:@selector(sinaWBShareFailed)]) {
                [self.delegate sinaWBShareFailed];
            }
        }
    }
}

- (void)request:(SinaWeiboRequest *)request didReceiveRawData:(NSData *)data{
    //    NSLog(@"data :%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding ]);
}

- (void)request:(SinaWeiboRequest *)request didFailError:(NSError *)error{
    NSLog(@"error:%@",[error debugDescription]);
}

#pragma mark SinaWeiboAuthorizeViewDelegate

- (void)authorizeView:(SinaWeiboAuthorizeView *)authView didFailWithErrorInfo:(NSDictionary *)errorInfo{
    
}

- (void)authorizeView:(SinaWeiboAuthorizeView *)authView didRecieveAuthorizationCode:(NSString *)code{
    
}

- (void)authorizeViewDidCancel:(SinaWeiboAuthorizeView *)authView{
    
}


#pragma mark SinaWeibo Share

- (void)loginSinaWeibo{
    [sinaWeibo logIn];
}

- (void)sharedToSinaWeiboWithObject:(SharedObject *)sharedObj{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    // HTTP请求方式
    NSString *httpMethod = REQUEST_METHOD_POST;
    
    // 微博请求的接口：
    // statuses/update              发布一条微博信息
    // statuses/upload              上传图片并发布一条微博
    // statuses/upload_url_text     发布一条微博同时指定上传的图片或图片url
    NSString *urlApi = @"";
    if (ShareInfoPurposeForImage == sharedObj.purpose)  {
        // 图片微博
        [param setObject:sharedObj.content forKey:@"status"];
        urlApi = @"statuses/upload.json";
        [param setObject:UIImageJPEGRepresentation(sharedObj.image, 1.0) forKey:@"pic"];
    }else if (ShareInfoPurposeForWebImage == sharedObj.purpose) {
        // 网络图片
        urlApi = @"statuses/upload_url_text.json";
        [param setObject:[sharedObj.shareUrl absoluteString] forKey:@"url"];
        [param setObject:sharedObj.content forKey:@"status"];
    }else {
        if (!sharedObj.shareUrl) {
            // 文字微博
            [param setObject:[NSString stringWithFormat:@"%@",sharedObj.content] forKey:@"status"];
        }else{
            [param setObject:[NSString stringWithFormat:@"%@ %@",sharedObj.content,[sharedObj.shareUrl absoluteString]] forKey:@"status"];
        }
        // URL链接分享
        urlApi = @"statuses/update.json";
    }
    
    if(![sinaWeibo isAuthValid])
    {
        [self loginSinaWeibo];
        return;
    }
    
    [sinaWeibo requestWithURL:urlApi params:param httpMethod:httpMethod delegate:self];
}

@end
