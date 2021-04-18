//
//  TrendingTableViewCell.swift
//  Popcorn
//
//  Created by Ramzy on 15/04/2021.
//

import UIKit
import Kingfisher

class TrendingTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ viewModel: TrendingCellViewModel) {
        guard let imageURL = URL(string: Constants.baseImageURL + viewModel.poster) else {return}
        self.movieImage.kf.setImage(with: imageURL)
        self.movieTitle.text = viewModel.originalTitle
        self.releaseDate.text = viewModel.releaseDate
        self.movieRate.text = "\(viewModel.voteAverage)"
    }    
}
