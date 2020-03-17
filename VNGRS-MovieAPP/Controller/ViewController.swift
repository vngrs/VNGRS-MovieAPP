//
//  ViewController.swift
//  VNGRS-MovieAPP
//
//  Created by Burak Kelleroğlu on 16.03.2020.
//  Copyright © 2020 Burak Kelleroğlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    var searchBar: UISearchBar {
        return searchController.searchBar
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarConfigure()
        // Do any additional setup after loading the view.
    }

    func searchBarConfigure() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Search..."
        tableView.tableHeaderView = searchController.searchBar
    }

}

