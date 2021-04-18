//
//  TrendingInteractor.swift
//  Popcorn
//
//  Created by Ramzy on 16/04/2021.
//

import Foundation
import RxSwift

protocol TrendingInteractorProtocol: class {
    func getTrendingMovies() -> Observable<(TrendingResponse,[TrendingResult])>
}

class TrendingInteractor:TrendingInteractorProtocol {
    var request: TrendingRequest?
    
    func getTrendingMovies() -> Observable<(TrendingResponse,[TrendingResult])> {
        return Observable.create {[weak self] (observer) -> Disposable in
            self?.request = TrendingRequest.getTrendingMovies
            self?.request?.send(TrendingResponse.self, completion: { (response) in
                switch response {
                case .success(let value):
                    let result = value.results
                    observer.onNext((value,result))
                case .failure(let error):
                    observer.onError(error)
                }
            })
            return Disposables.create()
        }
    }
}
