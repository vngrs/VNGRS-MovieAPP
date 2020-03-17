//
//  ViewController.swift
//  VNGRS-MovieAPP
//
//  Created by Burak Kelleroğlu on 16.03.2020.
//  Copyright © 2020 Burak Kelleroğlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BindableType {
    var viewModel: ViewModel!

    func bindViewModel() {
        viewModel.movie
            .drive(tableView.rx.items(cellIdentifier: "MovieCell")) { _, movie, cell in
                
        }
    }

    typealias ViewModelType = ViewModel

    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    var searchBar: UISearchBar {
        return searchController.searchBar
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarConfigure()
        bindViewModel()
        // Do any additional setup after loading the view.
    }

    func searchBarConfigure() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Search..."
        tableView.tableHeaderView = searchController.searchBar
    }

}

