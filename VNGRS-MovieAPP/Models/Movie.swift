//
//  Movie.swift
//  VNGRS-MovieAPP
//
//  Created by Burak Kelleroğlu on 16.03.2020.
//  Copyright © 2020 Burak Kelleroğlu. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let popularity: Double
    let voteCount: Int
    let posterPath: String?
    let title: String
    let voteAverage: Double
    let releaseDate: String

    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case posterPath = "poster_path"
        case title
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
    }
}
