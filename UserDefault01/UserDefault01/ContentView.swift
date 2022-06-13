//
//  ContentView.swift
//  UserDefault01
//
//  Created by Shin yongjun on 2022/06/12.
//

import SwiftUI

struct LoginCheck: View {
    @AppStorage("isLoggedIn") var isLoggedIn : Bool = UserDefaults.standard.bool(forKey: "isLoggedIn")
    
    
    var body: some View {
        if isLoggedIn {
            Button(action: {
                self.isLoggedIn = false
                }) {
                    Text("로그아웃")
                    }
            } else {
                Button(action: {
                    self.isLoggedIn = true
                    }) {
                        Text("로그인")
                        }
            }
        }
    }

struct LoginCheck_Previews: PreviewProvider {
    static var previews: some View {
        LoginCheck()
    }
}
