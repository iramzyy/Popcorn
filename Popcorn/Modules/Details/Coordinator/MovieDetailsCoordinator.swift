//
//  MovieDetailsCoordinator.swift
//  Popcorn
//
//  Created by Ramzy on 17/04/2021.
//

import Foundation
import UIKit

protocol MovieDetailsCoordinatorProtocol: class { }

class MovieDetailsCoordinator: Coordinator{
    unowned let navigationController: UINavigationController
    let movieId: Int
    
    init(navigationController: UINavigationController,movieId: Int) {
        self.navigationController = navigationController
        self.movieId = movieId
    }
    
    func start() {
        let movieDetailsViewController = MovieDetailsViewController()
        let movieDetailsViewModel = MovieDetailsViewModel(movieDetailsInteractor: MovieDetailsInteractor(), coordinator: self, movieId: movieId)
        movieDetailsViewController.viewModel = movieDetailsViewModel
        navigationController.navigationBar.isHidden = false
        navigationController.navigationBar.tintColor = .black
        navigationController.pushViewController(movieDetailsViewController, animated: true)
    }
}

extension MovieDetailsCoordinator: MovieDetailsCoordinatorProtocol { }

