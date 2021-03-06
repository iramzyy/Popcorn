//
//  AppCoordinator.swift
//  Popcorn
//
//  Created by Ramzy on 15/04/2021.
//

import UIKit

protocol Coordinator: class {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}


class AppCoordinator: Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        if #available(iOS 13.0, *) {
            navigationController.overrideUserInterfaceStyle = .light
        }
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        let trendingCoordinator = TrendingCoordinator(navigationController: navigationController)
        coordinate(to: trendingCoordinator)
    }
}
