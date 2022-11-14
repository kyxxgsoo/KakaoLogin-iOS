//
//  KakaoLoginTutorialApp.swift
//  KakaoLoginTutorial
//
//  Created by Kyungsoo Lee on 2022/11/12.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct KakaoLoginTutorialApp: App {
    
    @UIApplicationDelegateAdaptor var appDelegate : AppDelegate
    
//    init() {
//
//        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
//
//        // Kakao SDK 초기화
//        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
//    }
    
    var body: some Scene {
        WindowGroup {
            
            ContentView()
            
            //            // onOpenURL()을 사용해 커스텀 URL 스킴 처리
            //            ContentView().onOpenURL(perform: { url in
            //                if (AuthApi.isKakaoTalkLoginUrl(url)) {
            //                    AuthController.handleOpenUrl(url: url)
            //                }
            //            })
        }
    }
}
