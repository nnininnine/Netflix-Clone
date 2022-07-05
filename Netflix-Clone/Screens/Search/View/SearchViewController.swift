//
//  SearchViewController.swift
//  Netflix-Clone
//
//  Created by 7Peaks on 30/6/2565 BE.
//

import UIKit

class SearchViewController: UIViewController {
    // MARK: Properties

    private let discoverTableView: UITableView = {
        let tableView: UITableView = .init()
        tableView.register(UpcomingTableViewCell.nib(), forCellReuseIdentifier: UpcomingTableViewCell.identifier)
        return tableView
    }()

    // MARK: Init

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        discoverTableView.frame = view.bounds
    }

    // MARK: Methods

    func setup() {
        title = "Top search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always

        view.addSubview(discoverTableView)
    }
}
