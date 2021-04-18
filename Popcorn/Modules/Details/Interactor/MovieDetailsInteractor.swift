//
//  MovieDetailsInteractor.swift
//  Popcorn
//
//  Created by Ramzy on 17/04/2021.
//

import Foundation
import RxSwift

protocol MovieDetailsInteractorProtocol: class {
    func getMovieDetails(id:Int) -> Observable<(MovieDetailsResponse)>
}

class MovieDetailsInteractor:MovieDetailsInteractorProtocol {
    var request: MovieDetailsRequest?
    
    func getMovieDetails(id:Int) -> Observable<(MovieDetailsResponse)> {
        return Observable.create {[weak self] (observer) -> Disposable in
            self?.request = MovieDetailsRequest.getMovieDetails(id: id)
            self?.request?.send(MovieDetailsResponse.self, completion: { (response) in
                switch response {
                case .success(let value):
                    observer.onNext(value)
                case .failure(let error):
                    observer.onError(error)
                }
            })
            return Disposables.create()
        }
    }
}
