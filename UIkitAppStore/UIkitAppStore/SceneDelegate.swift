//
//  SceneDelegate.swift
//  UIkitAppStore
//
//  Created by Shin yongjun on 2022/10/28.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        window?.rootViewController = TabBarController() // 루트뷰컨트롤러 설정
        window?.makeKeyAndVisible() // 키 윈도우 설정
    }
}

