//
//  MovieService.swift
//  VNGRS-MovieAPP
//
//  Created by Burak Kelleroğlu on 17.03.2020.
//  Copyright © 2020 Burak Kelleroğlu. All rights reserved.
//

import Foundation
import RxSwift
import RxMoya
import Moya

struct MovieDictionary<T: Decodable>: Decodable {
    let results: [T]
}

protocol MovieService {
    func searchMovie(text: String) -> Single<[Movie]>
}
class MovieMockService: MovieService {
    let movieMock: MovieMock
    init(movieMock: MovieMock) {
        self.movieMock = movieMock
    }
    func searchMovie(text: String) -> Single<[Movie]> {
        Single.just(movieMock.movies)
    }


}
class MovieRealServices: MovieService {
    let provider = MoyaProvider<MovieAPI>()
    func searchMovie(text: String) -> Single<[Movie]> {
        return provider.rx.request(.searchMovies(query: text, page: 1)).map { response in
            try JSONDecoder().decode(Movies.self, from: response.data).results
        }
    }
}
