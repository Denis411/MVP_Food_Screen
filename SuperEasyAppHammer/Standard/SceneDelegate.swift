//
//  SceneDelegate.swift
//  SuperEasyAppHammer
//
//  Created by Dennis Programmer on 3/4/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let initialVC = ViewController()
        window?.rootViewController = initialVC
        window?.makeKeyAndVisible()
    }
}

