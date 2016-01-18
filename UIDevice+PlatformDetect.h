//
//  UIDevice+PlatformDetect.h
//  thehandsome
//
//  Created by Park Kyoung ho on 2016. 1. 15..
//  Copyright © 2016 mac. All rights reserved.
//
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DeviceType) {
    
    iPhone1G,
    iPhone3G,
    iPhone3GS,
    iPhone4,
    VerizoniPhone4,
    iPhone4S,
    iPhone5_GSM,
    iPhone5_GSM_CDMA,
    iPhone5c_GSM,
    iPhone5c_GSM_CDMA,
    iPhone5s_GSM,
    iPhone5s_GSM_CDMA,
    iPhone6,
    iPhone6Plus,
    iPhone6s,
    iPhone6sPlus,
    iPodTouch1G,
    iPodTouch2G,
    iPodTouch3G,
    iPodTouch4G,
    iPodTouch5G,
    iPodTouch6G,
    iPad,
    iPad2_WiFi,
    iPad2_GSM,
    iPad2_CDMA,
    iPadMini_WiFi,
    iPadMini_GSM,
    iPadMini_GSM_CDMA,
    iPad3_WiFi,
    iPad3_GSM_CDMA,
    iPad3_GSM,
    iPad4_WiFi,
    iPad4_GSM,
    iPad4_GSM_CDMA,
    iPadAir_WiFi,
    iPadAir_Cellular,
    iPadAir,
    iPadMini2G_WiFi,
    iPadMini2G_Cellular,
    iPadMini2G,
    iPadMini3_WiFi,
    iPadMini3_Cellular,
    iPadMini3_China,
    iPadAir2_WiFi,
    iPadAir2_Cellular,
    iPadPro_WiFi,
    iPadPro_Cellular,
    AppleTV2G,
    AppleTV3,
    AppleTV3_2013,
    Simulatorx32,
    Simulatorx64,
    unknown
};


@interface UIDevice (PlatformDetect)

+ (NSString *) platformRawString;
+ (NSString *) platformType;
+ (NSString *) platformTypeSimple;
+ (NSString *) networkType;

@end
