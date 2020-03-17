//
//  MovieCell.swift
//  VNGRS-MovieAPP
//
//  Created by Burak Kelleroğlu on 17.03.2020.
//  Copyright © 2020 Burak Kelleroğlu. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit

class MovieCell: UITableViewCell, Configurable {
    typealias ConfigurationType = MovieCellViewModel
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!

    func configure(for viewModel: MovieCellViewModel) {
        titleLabel.text = viewModel.movie.title
        releaseDateLabel.text = viewModel.movie.releaseDate
        if let posterImageStr = viewModel.movie.posterPath {
            posterImage.kf.setImage(with: URL.init(string: "https://image.tmdb.org/t/p/w500/\(posterImageStr)"))
        }
    }
}
