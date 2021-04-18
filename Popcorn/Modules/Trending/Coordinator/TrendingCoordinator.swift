//
//  TrendingCoordinator.swift
//  Popcorn
//
//  Created by Ramzy on 16/04/2021.
//

import Foundation
import UIKit

protocol TrendingCoordinatorProtocol: class {
    func pushToMovieDetails(with movieId: Int)
}

class TrendingCoordinator: Coordinator{
    
    
    unowned let navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    func start() {
        let trendingViewController = TrendingViewController()
        let trendingViewModel = TrendingViewModel(trendingMoviesInteractor: TrendingInteractor(),coordinator: self)
        trendingViewController.viewModel = trendingViewModel
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(trendingViewController, animated: true)
    }
}

extension TrendingCoordinator: TrendingCoordinatorProtocol {
    func pushToMovieDetails(with movieId: Int) {
        let movieDetailsCoordinator = MovieDetailsCoordinator(navigationController: navigationController, movieId: movieId)
        movieDetailsCoordinator.start()
    }
}
