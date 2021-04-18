//
//  MovieDetailsViewController.swift
//  Popcorn
//
//  Created by Ramzy on 16/04/2021.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
    
    private let disposeBag = DisposeBag()
    var viewModel: MovieDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.viewDidLoad()
        bindMovieDetails()
    }

    fileprivate func bindMovieDetails() {
        viewModel.movieDetails.subscribe {[weak self] (movieDetails) in
            self?.moviePoster.kf.setImage(with: URL(string: Constants.baseImageURL + movieDetails.element!.posterPath))
            self?.movieTitle.text = movieDetails.element?.originalTitle
            self?.movieGenre.text = movieDetails.element?.genres.first?.name
            self?.movieOverview.text = movieDetails.element?.overview
        }.disposed(by: disposeBag)
    }
}
