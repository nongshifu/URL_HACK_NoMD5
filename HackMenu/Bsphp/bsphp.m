#import "bsphp.h"
#import "LRKeychain.h"
#import <WebKit/WebKit.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import <mach-o/dyld.h>
#import <AVFoundation/AVFoundation.h>
#import <AdSupport/ASIdentifierManager.h>
#import "SCLAlertView.h"
#import "CaptainHook.h"
#import "defines.h"
#import <Foundation/Foundation.h>
#import "MF_Base64Additions.h"
#import "NSDictionary+StichingStringkeyValue.h"
#import "NSString+MD5.h"
#import "NSString+URLCode.h"
#import "UserInfoManager.h"
#import "Config.h"
#import "UIAlertView+Blocks.h"
//#import "chucaoDylib.h"
@interface VerifyEntry ()<UIAlertViewDelegate>
@end
@implementation YDcjash


-(void)Bsphp{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if([[NSUserDefaults standardUserDefaults] objectForKey:@"activationDeviceID"] != nil)
        {
            NSMutableDictionary *param = [NSMutableDictionary dictionary];
            param[@"api"] = @"login.ic";
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd#HH:mm:ss"];
            NSString *dateStr = [dateFormatter stringFromDate:[NSDate date]];
            param[@"BSphpSeSsL"] = [dateStr MD5Digest];
            NSDate *date = [NSDate date];
            NSTimeZone * zone = [NSTimeZone systemTimeZone];
            NSInteger interval = [zone secondsFromGMTForDate:date];
            NSDate * nowDate = [date dateByAddingTimeInterval:interval];
            NSString *nowDateStr = [[nowDate description] stringByReplacingOccurrencesOfString:@" +0000" withString:@""];
            param[@"date"] = nowDateStr;
            param[@"md5"] = @"";
            param[@"mutualkey"] = BSPHP_MUTUALKEY;
            param[@"icid"] = [[NSUserDefaults standardUserDefaults] objectForKey:@"activationDeviceID"];
            param[@"icpwd"] = @"";
            param[@"key"] = [[VerifyEntry MySharedInstance] getIDFA];
            param[@"maxoror"] = [[VerifyEntry MySharedInstance] getIDFA];
            [NetTool Post_AppendURL:BSPHP_HOST myparameters:param mysuccess:^(id responseObject)
             {
                 NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                      options:NSJSONReadingMutableContainers
                                                                        error:nil];
                 
                 if(!dict){
                     exit(0);//????????? ???????????? ????????????????????????
                 }                                if (dict)
                 {
                     NSString *dataString = dict[@"response"][@"data"];
                     NSRange range = [dataString rangeOfString:@"|1081|"];
                     NSLog(@"aaaaaaaa%@",dict);
                     
                     if (range.location != NSNotFound)
                     {
                         UserInfoManager *manager =   [UserInfoManager shareUserInfoManager];
                         NSArray *arr = [dataString componentsSeparatedByString:@"|"];
                         
                         
                         {
                             manager.state01 = arr[0];
                             manager.state1081 = arr[1];
                             manager.deviceID = arr[2];
                             manager.returnData = arr[3];
                             manager.expirationTime = arr[4];
                             manager.activationTime = arr[5];
                             NSLog(@"bbbbbbb%@",arr[4]);
                             if([arr[4] rangeOfString:@"???"].location !=NSNotFound){
                                 SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
                                 [alert addTimerToButtonIndex:0 reverse:YES];
                                 [alert addButton:@"??????" actionBlock:^{
                                     exit(0);
                                     
                                 }];
                                 [alert showInfo:@"??????????????????B??????" subTitle:@"??????????????????B??????" closeButtonTitle:nil duration:0.0f];
                                 
                             }else if([arr[4] rangeOfString:@"???"].location !=NSNotFound){
                                 SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
                                 [alert addTimerToButtonIndex:0 reverse:YES];
                                 [alert addButton:@"??????" actionBlock:^{
                                     exit(0);
                                     
                                 }];
                                 [alert showInfo:@"??????????????????B??????" subTitle:@"???????????????????????????" closeButtonTitle:nil duration:0.0f];
                             }
                             else if([arr[4] rangeOfString:@"Sh"].location !=NSNotFound){
                                 SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
                                 [alert addTimerToButtonIndex:0 reverse:YES];
                                 [alert addButton:@"??????" actionBlock:^{
                                     exit(0);
                                     
                                 }];
                                 [alert showInfo:@"??????????????????B??????" subTitle:@"???????????????????????????" closeButtonTitle:nil duration:0.0f];
                             }
                             
                             if(manager.deviceID != [[VerifyEntry MySharedInstance] getIDFA])
                             {
                                 
                                 
                                 manager.state01 = nil;
                                 manager.state1081 = nil;
                                 manager.deviceID = nil;
                                 manager.returnData = nil;
                                 manager.expirationTime = nil;
                                 manager.activationTime = nil;
                                 //????????????????????????
                                 
                                 DisPatchGetMainQueueBegin();
                                 NSString *showMsg = [NSString stringWithFormat:@"????????????: %@", arr[4]];
                                 SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
                                 [alert addTimerToButtonIndex:0 reverse:YES];
                                 //                                                                         [alert addButton:@"??????" actionBlock:^{
                                 //
                                 //                                                                         }];
                                 [alert showInfo:@"WG6.4" subTitle:showMsg closeButtonTitle:@"????????????" duration:0.0f];
                                 DisPatchGetMainQueueEnd();
                                 
                                 
                             }
                         }
                     }
                     else
                     {
                         UserInfoManager *manager =   [UserInfoManager shareUserInfoManager];
                         manager.state01 = nil;
                         manager.state1081 = nil;
                         manager.deviceID = nil;
                         manager.returnData = nil;
                         manager.expirationTime = nil;
                         manager.activationTime = nil;
                         
                         //??????????????????
                         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
                                        {
                                            [[VerifyEntry MySharedInstance] processActivate];
                                            
                                        });
                     }
                 }
             } myfailure:^(NSError *error)
             {
                 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
                                {
                                    [[VerifyEntry MySharedInstance] processActivate];
                                });
             }];
        }
        else
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
                           {
                               [[VerifyEntry MySharedInstance] processActivate];
                           });
        }
        
    });
}
@end
@implementation VerifyEntry

+ (instancetype)MySharedInstance
{
    static VerifyEntry *sharedSingleton;
    
    if (!sharedSingleton)
    {
        static dispatch_once_t oncePPM;
        dispatch_once(&oncePPM, ^
                      {
                          sharedSingleton = [[VerifyEntry alloc] init];
                      });
    }
    
    return sharedSingleton;
}


- (NSString*)getIDFA
{
    ASIdentifierManager *as = [ASIdentifierManager sharedManager];
    return as.advertisingIdentifier.UUIDString;
}

- (void)showAlertMsg:(NSString *)show error:(BOOL)error
{
    
    DisPatchGetMainQueueBegin();
    SCLAlertView *alert =  [[SCLAlertView alloc] initWithNewWindow];
    if (error) {
        [alert showError:@"" subTitle:show closeButtonTitle:@"??????" duration:2];
    }else{
        [alert showInfo:show subTitle:@"??????" closeButtonTitle:@"??????" duration:2];
        
    }
    DisPatchGetMainQueueEnd();
}

- (void)startProcessActivateProcess:(NSString *)code finish:(void (^)(NSDictionary *done))finish
{
    //???????????????
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"api"] = @"login.ic";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd#HH:mm:ss"];
    NSString *dateStr = [dateFormatter stringFromDate:[NSDate date]];
    param[@"BSphpSeSsL"] = [dateStr MD5Digest];
    NSDate *date = [NSDate date];
    NSTimeZone * zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate * nowDate = [date dateByAddingTimeInterval:interval];
    NSString *nowDateStr = [[nowDate description] stringByReplacingOccurrencesOfString:@" +0000" withString:@""];
    param[@"date"] = nowDateStr;
    param[@"md5"] = @"";
    param[@"mutualkey"] = BSPHP_MUTUALKEY;
    param[@"icid"] = code;
    param[@"icpwd"] = @"";
    param[@"key"] = [self getIDFA];
    param[@"maxoror"] = [self getIDFA];
    [NetTool Post_AppendURL:BSPHP_HOST myparameters:param mysuccess:^(id responseObject)
     {
         
         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
         if(!dict){
             // exit(0);//????????? ???????????? ????????????????????????
         }
         if (dict)
         {
             NSString *dataString = dict[@"response"][@"data"];
             NSRange range = [dataString rangeOfString:@"|1081|"];
             if(![dataString containsString:[self getIDFA]]){
                 [self showAlertMsg:@"????????????" error:YES];
                 [self processActivate];
             }
             else if (range.location != NSNotFound)
             {
                 NSString *activationDID = [[NSUserDefaults standardUserDefaults]objectForKey:@"activationDeviceID"];
                 if (![activationDID isEqualToString:code])
                 {
                     [[NSUserDefaults standardUserDefaults] setObject:code forKey:@"activationDeviceID"];
                 }
                 
                 UserInfoManager *manager =   [UserInfoManager shareUserInfoManager];
                 NSArray *arr = [dataString componentsSeparatedByString:@"|"];
                 if (arr.count >= 6)
                 {
                     manager.state01 = arr[0];
                     manager.state1081 = arr[1];
                     manager.deviceID = arr[2];
                     manager.returnData = arr[3];
                     manager.expirationTime = arr[4];
                     manager.activationTime = arr[5];
                     
                     DisPatchGetMainQueueBegin();
                     
                     NSString *showMsg = [NSString stringWithFormat:@"  ????????????\n %@ \n??????????????????", arr[4]];
                     
                     
                     SCLAlertView *alert =  [[SCLAlertView alloc] initWithNewWindow];
                     [alert showWarning:@"??????" subTitle:showMsg closeButtonTitle:nil duration:0];
                     
                     
                     DisPatchGetMainQueueEnd();
                 }
             }
             else
             {
                 NSString *messageStr = dict[@"response"][@"data"];
                 UserInfoManager *manager =   [UserInfoManager shareUserInfoManager];
                 manager.state01 = nil;
                 manager.state1081 = nil;
                 manager.deviceID = nil;
                 manager.returnData = nil;
                 manager.expirationTime = nil;
                 manager.activationTime = nil;
                 [self showAlertMsg:messageStr error:YES];
                 [self processActivate];
             }
         }
     } myfailure:^(NSError *error)
     {
         [self processActivate];
     }];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *CONFIRM = @"??????";
    
    NSString *btnTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if (YES == [btnTitle isEqualToString:CONFIRM])
    {
        UITextField *tf = [alertView textFieldAtIndex:0];
        if (nil == tf.text || 0 == tf.text.length)
        {
            [self processActivate];
            return ;
        }
        
        [self startProcessActivateProcess:tf.text finish:nil];
    }
    else
    {
        [self processActivate];
    }
}

- (void)processActivate
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (![UserInfoManager shareUserInfoManager].deviceID) {
                //                exit(0);
            }
        });
    });
    SCLAlertView *alert =  [[SCLAlertView alloc] initWithNewWindow];
    alert.shouldDismissOnTapOutside = NO;
    SCLTextView *textF =   [alert addTextField:@"???????????????????????????:"setDefaultText:nil];
    [alert alertDismissAnimationIsCompleted:^{
        if (textF.text.length==0) {
            [self processActivate];
        }else{
            [self startProcessActivateProcess:textF.text finish:nil];
        }
    }];
    [alert showWarning:@"??????" subTitle:@"????????????????????????" closeButtonTitle:@"??????" duration:0];
    
}
@end












