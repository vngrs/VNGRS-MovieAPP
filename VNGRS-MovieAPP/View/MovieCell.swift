//
//  MovieCell.swift
//  VNGRS-MovieAPP
//
//  Created by Burak Kelleroğlu on 17.03.2020.
//  Copyright © 2020 Burak Kelleroğlu. All rights reserved.
//

import Foundation
import UIKit

class MovieCell: UITableViewCell, Configurable {
    typealias ConfigurationType = ViewModel
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!

    func configure(for viewModel: ViewModel) {
        titleLabel.text = viewModel.movies.title
        releaseDateLabel.text = viewModel.movies.releaseDate
    }



}
