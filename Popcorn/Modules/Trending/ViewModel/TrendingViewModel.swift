//
//  TrendingViewModel.swift
//  Popcorn
//
//  Created by Ramzy on 16/04/2021.
//

import Foundation
import RxSwift
import RxCocoa

protocol TrendingViewModelOutput {
    func  trendingMovieViewModelAtIndexPath(_ indexPath: IndexPath) -> TrendingCellViewModel
}

protocol TrendingViewModelInput {
    func viewDidLoad()
    func didSelectItemAtIndexPath(_ indexPath: IndexPath)
}

class TrendingViewModel:TrendingViewModelInput , TrendingViewModelOutput {
    
    private let coordinator: TrendingCoordinator
    let disposeBag = DisposeBag()
    
    var movies: BehaviorRelay<[TrendingCellViewModel]> = .init(value: [])
    var navigateToItemDetails: PublishSubject<Int> = .init()
    
    private let trendingMoviesInteractor: TrendingInteractorProtocol
    
    init(trendingMoviesInteractor:TrendingInteractorProtocol = TrendingInteractor(),coordinator: TrendingCoordinator) {
        self.trendingMoviesInteractor = trendingMoviesInteractor
        self.coordinator = coordinator
        bindSelectedMovie()
    }
    
    func viewDidLoad(){
        getTrendingMovies()
       
    }
    
    private func getTrendingMovies() {
        trendingMoviesInteractor.getTrendingMovies().subscribe{ (response,movies) in
            self.movies.accept(movies.map(TrendingCellViewModel.init))
        }.disposed(by: disposeBag)
    }
    
    
    func trendingMovieViewModelAtIndexPath(_ indexPath: IndexPath) -> TrendingCellViewModel {
        return movies.value[indexPath.row]
    }
    
    func didSelectItemAtIndexPath(_ indexPath: IndexPath) {
        let movieId = movies.value[indexPath.row].id
        navigateToItemDetails.onNext(movieId)
    }
    
    func bindSelectedMovie() {
        navigateToItemDetails.asObservable().subscribe { [weak self] (movieId) in
            guard let movieId = movieId.element else { return }
            self?.coordinator.pushToMovieDetails(with: movieId)
        }.disposed(by: disposeBag)
    }
    
}
