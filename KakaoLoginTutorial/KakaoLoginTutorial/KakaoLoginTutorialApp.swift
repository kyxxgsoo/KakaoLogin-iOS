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
    
    init() {
        
        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
        
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
