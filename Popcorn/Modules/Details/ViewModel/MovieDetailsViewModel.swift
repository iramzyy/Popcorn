//
//  MovieDetailsViewModel.swift
//  Popcorn
//
//  Created by Ramzy on 17/04/2021.
//

import Foundation
import RxSwift
import RxCocoa

protocol MovieDetailsViewModelOutput {

}

protocol MovieDetailsModelInput {
    func viewDidLoad()
}

class MovieDetailsViewModel:MovieDetailsModelInput , MovieDetailsViewModelOutput {

    private let coordinator: MovieDetailsCoordinator
    let disposeBag = DisposeBag()
    
    var movieDetails: PublishSubject<MovieDetailsResponse> = .init()
    var movieId: Int
    
    private let movieDetailsInteractor: MovieDetailsInteractorProtocol
    
    init(movieDetailsInteractor:MovieDetailsInteractorProtocol = MovieDetailsInteractor(),coordinator: MovieDetailsCoordinator, movieId: Int) {
        self.movieDetailsInteractor = movieDetailsInteractor
        self.coordinator = coordinator
        self.movieId = movieId
    }
    
    func viewDidLoad(){
        getTrendingMovies()
    }
    
    private func getTrendingMovies() {
        movieDetailsInteractor.getMovieDetails(id: movieId).subscribe{[weak self] (response) in
            self?.movieDetails.onNext(response)
        }.disposed(by: disposeBag)

    }
}
