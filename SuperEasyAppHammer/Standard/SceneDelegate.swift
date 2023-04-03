//
//  SceneDelegate.swift
//  SuperEasyAppHammer
//
//  Created by Dennis Programmer on 3/4/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    static let rootComponent = RootComponent()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        registerProviderFactories()
        window = UIWindow(windowScene: scene)
        let sharedNavController = SceneDelegate.rootComponent.navigationController
        window?.rootViewController = sharedNavController
        window?.makeKeyAndVisible()
    }
}

