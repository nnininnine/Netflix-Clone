//
//  SearchViewController.swift
//  Netflix-Clone
//
//  Created by 7Peaks on 30/6/2565 BE.
//

import RxCocoa
import RxSwift
import UIKit

class SearchViewController: UIViewController {
    // MARK: Properties

    private lazy var viewModel: SearchViewModel = .init()

    private let discoverTableView: UITableView = {
        let tableView: UITableView = .init()
        tableView.register(UpcomingTableViewCell.nib(), forCellReuseIdentifier: UpcomingTableViewCell.identifier)
        return tableView
    }()

    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: SearchResultViewController())
        searchController.searchBar.placeholder = "Search for a Movie or a Tv show"
        searchController.searchBar.searchBarStyle = .minimal
        return searchController
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
        navigationController?.navigationBar.tintColor = .label
        navigationItem.searchController = searchController

        view.addSubview(discoverTableView)
        discoverTableView.delegate = self

        bindingData()
    }

    func bindingData() {
        // binding table view
        viewModel.discoverPublisher.asObserver().bind(to: discoverTableView.rx.items(cellIdentifier: UpcomingTableViewCell.identifier)) { (_: Int, movie: TitleMovie, cell: UpcomingTableViewCell) in
            cell.configure(with: movie)
        }.disposed(by: viewModel.disposeBag)

        viewModel.getDiscoverMovies()

        // subscribe search bar
        searchController.searchBar.rx.text.orEmpty.asObservable().debounce(.seconds(1), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] text in
                guard let resultsController = self?.searchController.searchResultsController as? SearchResultViewController else { return }
                resultsController.viewModel.query = text.replacingOccurrences(of: " ", with: "+")
            }).disposed(by: viewModel.disposeBag)
    }
}

// MARK: Extensions

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
