//
//  TrendingViewController.swift
//  Popcorn
//
//  Created by Ramzy on 15/04/2021.
//

import UIKit
import RxSwift
import RxCocoa

class TrendingViewController: UIViewController {
    
    @IBOutlet weak var trendingMovies: UITableView!
    
    private let disposeBag = DisposeBag()
    var viewModel: TrendingViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        viewModel.viewDidLoad()
        bindTableView()
    }
    
    fileprivate func setupTableView() {
        trendingMovies.registerCellNib(cellClass: TrendingTableViewCell.self)
    }
    
    fileprivate func bindTableView() {
        viewModel.movies
            .bind(to: trendingMovies.rx.items(
                    cellIdentifier: "TrendingTableViewCell",
                    cellType: TrendingTableViewCell.self)) { row, element, cell in
                let indexPath = IndexPath(row: row, section: 0)
                cell.configure(self.viewModel.trendingMovieViewModelAtIndexPath(indexPath))
            }
            .disposed(by: disposeBag)
        
        
        trendingMovies.rx.itemSelected.subscribe {[weak self]  (indexPath) in
            guard let indexPath = indexPath.element else { return }
            self?.viewModel.didSelectItemAtIndexPath(indexPath)
        }.disposed(by: disposeBag)
     
        
       
    }
}

