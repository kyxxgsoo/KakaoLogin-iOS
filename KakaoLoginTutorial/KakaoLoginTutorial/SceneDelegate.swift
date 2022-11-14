//
//  SceneDelegate.swift
//  KakaoLoginTutorial
//
//  Created by Kyungsoo Lee on 2022/11/14.
//

import Foundation
import KakaoSDKAuth
import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                _ = AuthController.handleOpenUrl(url: url)
            }
        }
    }
    
}
