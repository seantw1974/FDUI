//
//  FDUIDefine.h
//  FDUIKitObjC
//
//  Created by fandongtongxue on 2020/2/26.
//

#ifndef FDUIDefine_h
#define FDUIDefine_h

#define FD_ScreenWidth [UIScreen mainScreen].bounds.size.width
#define FD_ScreenHeight [UIScreen mainScreen].bounds.size.height

#define FD_StatusBar_Height [UIApplication sharedApplication].statusBarFrame.size.height
#define FD_Navigation_Height 44
#define FD_Bottom_Height (FD_StatusBar_Height > 20.0 ? 83 : 49)
#define FD_Bottom_SafeArea_Height (FD_StatusBar_Height > 20.0 ? 34 : 0)
#define FD_Top_Height FD_StatusBar_Height + FD_Navigation_Height

#endif /* FDUIDefine_h */
