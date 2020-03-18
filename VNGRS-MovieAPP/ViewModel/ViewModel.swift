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
import RxDataSources
import Swinject

typealias MovieSection = AnimatableSectionModel<String, Movie>

struct ViewModel {
    let searchText = PublishSubject<String>()
    private var movieService: MovieService = Container.shared.resolve(MovieService.self)!

    lazy var movie: Driver<[MovieSection]> = searchText
        .throttle(.milliseconds(300), latest: true, scheduler: MainScheduler.instance)
        .distinctUntilChanged()
        .filter { !$0.isEmpty }
        .flatMap { [movieService] text in
            movieService.searchMovie(text: text).debug("SearchMovies", trimOutput: false)
    }
    .debug()
    .map { [MovieSection(model: "", items: $0)] }
    .asDriver(onErrorJustReturn: [])

    func cellViewModel(for movie: Movie) -> MovieCellViewModel {
        MovieCellViewModel(movie: movie)
    }
}
