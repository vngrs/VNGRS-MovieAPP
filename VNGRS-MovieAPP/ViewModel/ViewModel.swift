//
//  ViewModeel.swift
//  VNGRS-MovieAPP
//
//  Created by Burak Kelleroğlu on 17.03.2020.
//  Copyright © 2020 Burak Kelleroğlu. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

struct ViewModel {
    let searchText = PublishSubject<String>()
    private var movieService: MovieService!
    lazy var movie: Driver<[Movie]> = searchText
        .throttle(0.3, scheduler: MainScheduler.instance)
        .distinctUntilChanged()
        .flatMapLatest { [movieService] text in
            movieService!.searchMovie(text: text)
    }.asDriver(onErrorJustReturn: [])
    let movies: Movie

    init(movies: Movie) {
        self.movies = movies
    }
}
