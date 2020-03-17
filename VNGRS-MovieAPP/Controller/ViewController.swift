//
//  ViewController.swift
//  VNGRS-MovieAPP
//
//  Created by Burak Kelleroğlu on 16.03.2020.
//  Copyright © 2020 Burak Kelleroğlu. All rights reserved.
//
import RxDataSources
import UIKit
import Rswift
import NSObject_Rx
class ViewController: UIViewController, BindableType {

    typealias ViewModelType = ViewModel
    @IBOutlet private weak var tableView: UITableView!
    var viewModel: ViewModel! = ViewModel(movies: MovieMock().movie)

    let searchController = UISearchController(searchResultsController: nil)
    var searchBar: UISearchBar {
        return searchController.searchBar
    }
    private lazy var dataSource = RxTableViewSectionedAnimatedDataSource<MovieSection>(
        reuseIdentifier: R.reuseIdentifier.movieCell, provider: viewModel.cellViewModel(for:))

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(R.nib.movieCell)
        searchBarConfigure()
        bindViewModel()
        // Do any additional setup after loading the view.
    }


    func bindViewModel() {
        viewModel.movie
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: rx.disposeBag)
        searchBar.rx.text
            .orEmpty
            .bind(to: viewModel.searchText)
            .disposed(by: rx.disposeBag)
    }

    func searchBarConfigure() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Search..."
        tableView.tableHeaderView = searchController.searchBar
    }

}

