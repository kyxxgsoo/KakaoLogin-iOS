//
//  KakaoAuthViewModel.swift
//  KakaoLoginTutorial
//
//  Created by Kyungsoo Lee on 2022/11/14.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser

class KakaoAuthViewModel : ObservableObject {
    
    @Published var isLoggedIn : Bool = false
    
    //Main Thread에서 돌게끔 해주는 프로퍼티
    @MainActor
    func kakaoLogout() {
        Task {
            if await handleKakaoLogout() {
                isLoggedIn = false
            }
        }
    }
    
    func handleKakaoLogout() async -> Bool {
        
        await withCheckedContinuation { continuation in
            UserApi.shared.logout {(error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                } else {
                    print("logout() success.")
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    func handleLoginWithKakaoTalkApp() async -> Bool {
        
        await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    //do something
                    _ = oauthToken
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    func handleLoginWithKakaoAccount() async -> Bool {
        
        await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    
                    //do something
                    _ = oauthToken
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    //Main Thread에서 돌게끔 해주는 프로퍼티
    @MainActor
    func handleKakaoLogin() {
        Task {
            // 카카오톡 설치 여부 확인 - 사용자의 핸드폰에 카카오 앱이 설치가 되어있는지?(카카오톡 설치여부)
            if (UserApi.isKakaoTalkLoginAvailable()) {
                // 설치가 되어있으면 카카오 앱을 통해 로그인 - loginWithKakaoTalk()
                isLoggedIn = await handleLoginWithKakaoTalkApp()
            } else {    // 설치가 안되어있을 때
                // 카카오 웹 뷰로 로그인 - loginWithKakaoAccount()
                isLoggedIn = await handleLoginWithKakaoAccount()
                
            }
        }
    }
}
