//
//  ContentView.swift
//  KakaoLoginTutorial
//
//  Created by Kyungsoo Lee on 2022/11/12.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var kakaoAuthVM : KakaoAuthViewModel = KakaoAuthViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, world!")
                .padding()
            Button("카카오 로그인", action: {
                kakaoAuthVM.handleKakaoLogin()
            })
            Button("카카오 로그아웃", action: {kakaoAuthVM.handleKakaoLogout()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
