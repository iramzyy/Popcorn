//
//  SceneDelegate.swift
//  Popcorn
//
//  Created by Ramzy on 15/04/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        appCoordinator = AppCoordinator(window: window!)
        appCoordinator?.start()
    }
}

