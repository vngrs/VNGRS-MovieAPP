//
//  MovieService.swift
//  VNGRS-MovieAPP
//
//  Created by Burak Kelleroğlu on 17.03.2020.
//  Copyright © 2020 Burak Kelleroğlu. All rights reserved.
//

import Foundation
import RxSwift

protocol MovieService {
    func searchMovie(text: String) -> Observable<[Movie]>
}
class MovieMockService: MovieService {
    let movieMock: MovieMock
    init(movieMock: MovieMock) {
        self.movieMock = movieMock
    }
    func searchMovie(text: String) -> Observable<[Movie]> {
        Observable.just(movieMock.movies)
    }


}
