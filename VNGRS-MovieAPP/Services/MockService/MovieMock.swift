//
//  MovieMock.swift
//  VNGRS-MovieAPP
//
//  Created by Burak Kelleroğlu on 16.03.2020.
//  Copyright © 2020 Burak Kelleroğlu. All rights reserved.
//

import Foundation
#if MOCK
class MovieMock {
    let movie = Movie(popularity: 52.277, voteCount: 2705, posterPath: "https://m.media-amazon.com/images/M/MV5BOTIzYmUyMmEtMWQzNC00YzExLTk3MzYtZTUzYjMyMmRiYzIwXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_UY268_CR1,0,182,268_AL_.jpg", title: "Fast & Furious Presents: Hobbs & Shaw", voteAverage: "6.6", releaseDate: "2019-08-01")
    lazy private(set) var movies = [movie, movie, movie]
}

#endif
