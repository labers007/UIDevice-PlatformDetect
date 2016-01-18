//
//  UIDevice+PlatformDetect.m
//
//  Created by Park Kyoung ho on 2016. 1. 15..
//  Copyright © 2016 mac. All rights reserved.
//
#include <sys/sysctl.h>
#import "UIDevice+PlatformDetect.h"
DeviceType currentPlatform() {
    NSString *platform = [UIDevice platformRawString];
    if ([platform isEqualToString:@"iPhone1,1"])    return iPhone1G;
    if ([platform isEqualToString:@"iPhone1,2"])    return iPhone3G;
    if ([platform isEqualToString:@"iPhone2,1"])    return iPhone3GS;
    if ([platform isEqualToString:@"iPhone3,1"])    return iPhone4;
    if ([platform isEqualToString:@"iPhone3,3"])    return VerizoniPhone4;
    if ([platform isEqualToString:@"iPhone4,1"])    return iPhone4S;
    if ([platform isEqualToString:@"iPhone5,1"])    return iPhone5_GSM;
    if ([platform isEqualToString:@"iPhone5,2"])    return iPhone5_GSM_CDMA;
    if ([platform isEqualToString:@"iPhone5,3"])    return iPhone5c_GSM;
    if ([platform isEqualToString:@"iPhone5,4"])    return iPhone5c_GSM_CDMA;
    if ([platform isEqualToString:@"iPhone6,1"])    return iPhone5s_GSM;
    if ([platform isEqualToString:@"iPhone6,2"])    return iPhone5s_GSM_CDMA;
    if ([platform isEqualToString:@"iPhone7,2"])    return iPhone6;
    if ([platform isEqualToString:@"iPhone7,1"])    return iPhone6Plus;
    if ([platform isEqualToString:@"iPhone8,1"])    return iPhone6s;
    if ([platform isEqualToString:@"iPhone8,2"])    return iPhone6sPlus;
    if ([platform isEqualToString:@"iPod1,1"])      return iPodTouch1G;
    if ([platform isEqualToString:@"iPod2,1"])      return iPodTouch2G;
    if ([platform isEqualToString:@"iPod3,1"])      return iPodTouch3G;
    if ([platform isEqualToString:@"iPod4,1"])      return iPodTouch4G;
    if ([platform isEqualToString:@"iPod5,1"])      return iPodTouch5G;
    if ([platform isEqualToString:@"iPod7,1"])      return iPodTouch6G;
    if ([platform isEqualToString:@"iPad1,1"])      return iPad;
    if ([platform isEqualToString:@"iPad2,1"])      return iPad2_WiFi;
    if ([platform isEqualToString:@"iPad2,2"])      return iPad2_GSM;
    if ([platform isEqualToString:@"iPad2,3"])      return iPad2_CDMA;
    if ([platform isEqualToString:@"iPad2,4"])      return iPad2_WiFi;
    if ([platform isEqualToString:@"iPad2,5"])      return iPadMini_WiFi;
    if ([platform isEqualToString:@"iPad2,6"])      return iPadMini_GSM;
    if ([platform isEqualToString:@"iPad2,7"])      return iPadMini_GSM_CDMA;
    if ([platform isEqualToString:@"iPad3,1"])      return iPad3_WiFi;
    if ([platform isEqualToString:@"iPad3,2"])      return iPad3_GSM;
    if ([platform isEqualToString:@"iPad3,3"])      return iPad3_GSM_CDMA;
    if ([platform isEqualToString:@"iPad3,4"])      return iPad4_WiFi;
    if ([platform isEqualToString:@"iPad3,5"])      return iPad4_GSM;
    if ([platform isEqualToString:@"iPad3,6"])      return iPad4_GSM_CDMA;
    if ([platform isEqualToString:@"iPad4,1"])      return iPadAir_WiFi;
    if ([platform isEqualToString:@"iPad4,2"])      return iPadAir_Cellular;
    if ([platform isEqualToString:@"iPad4,3"])      return iPadAir;
    if ([platform isEqualToString:@"iPad4,4"])      return iPadMini2G_WiFi;
    if ([platform isEqualToString:@"iPad4,5"])      return iPadMini2G_Cellular;
    if ([platform isEqualToString:@"iPad4,6"])      return iPadMini2G;
    if ([platform isEqualToString:@"iPad4,7"])      return iPadMini3_WiFi;
    if ([platform isEqualToString:@"iPad4,8"])      return iPadMini3_Cellular;
    if ([platform isEqualToString:@"iPad4,9"])      return iPadMini3_China;
    if ([platform isEqualToString:@"iPad5,3"])      return iPadAir2_WiFi;
    if ([platform isEqualToString:@"iPad5,4"])      return iPadAir2_Cellular;
    if ([platform isEqualToString:@"iPad6,7"])      return iPadPro_WiFi;
    if ([platform isEqualToString:@"iPad6,8"])      return iPadPro_Cellular;
    if ([platform isEqualToString:@"AppleTV2,1"])   return AppleTV2G;
    if ([platform isEqualToString:@"AppleTV3,1"])   return AppleTV3;
    if ([platform isEqualToString:@"AppleTV3,2"])   return AppleTV3_2013;
    if ([platform isEqualToString:@"i386"])         return Simulatorx32;
    if ([platform isEqualToString:@"x86_64"])       return Simulatorx64;
    return unknown;
}

@implementation UIDevice (PlatformDetect)

+ (NSString *) platformRawString
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

+ (NSString *) platformType
{
    NSString *platform = [UIDevice platformRawString];
    if (currentPlatform() == iPhone1G)          return @"iPhone 1G";
    if (currentPlatform() == iPhone3G)          return @"iPhone 3G";
    if (currentPlatform() == iPhone3GS)         return @"iPhone 3GS";
    if (currentPlatform() == iPhone4)           return @"iPhone 4";
    if (currentPlatform() == VerizoniPhone4)    return @"Verizon iPhone 4";
    if (currentPlatform() == iPhone4S)          return @"iPhone 4S";
    if (currentPlatform() == iPhone5_GSM)       return @"iPhone 5 (GSM)";
    if (currentPlatform() == iPhone5_GSM_CDMA)  return @"iPhone 5 (GSM+CDMA)";
    if (currentPlatform() == iPhone5c_GSM)      return @"iPhone 5c (GSM)";
    if (currentPlatform() == iPhone5c_GSM_CDMA) return @"iPhone 5c (GSM+CDMA)";
    if (currentPlatform() == iPhone5s_GSM)      return @"iPhone 5s (GSM)";
    if (currentPlatform() == iPhone5s_GSM_CDMA) return @"iPhone 5s (GSM+CDMA)";
    if (currentPlatform() == iPhone6)           return @"iPhone 6 (GSM+CDMA)";
    if (currentPlatform() == iPhone6Plus)       return @"iPhone 6 Plus (GSM+CDMA)";
    if (currentPlatform() == iPhone6s)          return @"iPhone 6s (GSM+CDMA)";
    if (currentPlatform() == iPhone6sPlus)      return @"iPhone 6s Plus (GSM+CDMA)";
    if (currentPlatform() == iPodTouch1G)       return @"iPod Touch 1G";
    if (currentPlatform() == iPodTouch2G)       return @"iPod Touch 2G";
    if (currentPlatform() == iPodTouch3G)       return @"iPod Touch 3G";
    if (currentPlatform() == iPodTouch4G)       return @"iPod Touch 4G";
    if (currentPlatform() == iPodTouch5G)       return @"iPod Touch 5G";
    if (currentPlatform() == iPad)              return @"iPad";
    if (currentPlatform() == iPad2_WiFi)        return @"iPad 2 (WiFi)";
    if (currentPlatform() == iPad2_GSM)         return @"iPad 2 (GSM)";
    if (currentPlatform() == iPad2_CDMA)        return @"iPad 2 (CDMA)";
    if (currentPlatform() == iPadMini_WiFi)     return @"iPad Mini (WiFi)";
    if (currentPlatform() == iPadMini_GSM)      return @"iPad Mini (GSM)";
    if (currentPlatform() == iPadMini_GSM_CDMA) return @"iPad Mini (GSM+CDMA)";
    if (currentPlatform() == iPad3_WiFi)        return @"iPad 3 (WiFi)";
    if (currentPlatform() == iPad3_GSM_CDMA)    return @"iPad 3 (GSM+CDMA)";
    if (currentPlatform() == iPad3_GSM)         return @"iPad 3 (GSM)";
    if (currentPlatform() == iPad4_WiFi)        return @"iPad 4 (WiFi)";
    if (currentPlatform() == iPad4_GSM)         return @"iPad 4 (GSM)";
    if (currentPlatform() == iPad4_GSM_CDMA)    return @"iPad 4 (GSM+CDMA)";
    if (currentPlatform() == iPadAir_WiFi)      return @"iPad Air (WiFi)";
    if (currentPlatform() == iPadAir_Cellular)  return @"iPad Air (Cellular)";
    if (currentPlatform() == iPadAir)           return @"iPad Air";
    if (currentPlatform() == iPadMini2G_WiFi)   return @"iPad Mini 2G (WiFi)";
    if (currentPlatform() == iPadMini2G_Cellular)return @"iPad Mini 2G (Cellular)";
    if (currentPlatform() == iPadMini2G)        return @"iPad Mini 2G";
    if (currentPlatform() == iPadMini3_WiFi)    return @"iPad Mini 3 (WiFi)";
    if (currentPlatform() == iPadMini3_Cellular)return @"iPad Mini 3 (Cellular)";
    if (currentPlatform() == iPadMini3_China)   return @"iPad Mini 3 China";
    if (currentPlatform() == iPadAir2_WiFi)     return @"iPad Air 2 (WiFi)";
    if (currentPlatform() == iPadAir2_Cellular) return @"iPad Air 2 (Cellular)";
    if (currentPlatform() == iPadPro_WiFi)      return @"iPad Pro (WiFi)";
    if (currentPlatform() == iPadPro_Cellular)  return @"iPad Pro (Cellular)";
    if (currentPlatform() == AppleTV2G)         return @"Apple TV 2G";
    if (currentPlatform() == AppleTV3)          return @"Apple TV 3";
    if (currentPlatform() == AppleTV3_2013)     return @"Apple TV 3 2013";
    if (currentPlatform() == Simulatorx32)      return @"Simulator 32";
    if (currentPlatform() == Simulatorx64)      return @"Simulator 64";
    return [NSString stringWithFormat:@"%@ %@",platform,@"unknown"];
}

+ (NSString *) platformTypeSimple
{
    NSString * platform  = [UIDevice platformType];
    
    NSMutableArray * strs = (NSMutableArray *)[platform componentsSeparatedByString:@" "];
    if([strs count] > 0) {
        if([(NSString *)[strs lastObject] hasSuffix:@")"]) {
            [strs removeObjectAtIndex:[strs count]-1];
        }
        
        return [strs componentsJoinedByString:@" "];
    }
    return platform;
}

+ (NSString *) networkType
{
    NSString * platform  = [UIDevice platformType];
    
    NSMutableArray * strs = (NSMutableArray *)[platform componentsSeparatedByString:@" "];
    if([strs count] > 0) {
        if([(NSString *)[strs lastObject] hasSuffix:@")"]) {
            
            return [[(NSString *)[strs lastObject] stringByReplacingOccurrencesOfString:@"(" withString:@""]
                    stringByReplacingOccurrencesOfString:@")" withString:@""];
        }
    }
    return nil;
}

@end
