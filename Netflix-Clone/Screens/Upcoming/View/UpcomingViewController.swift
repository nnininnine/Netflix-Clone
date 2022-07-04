//
//  UpcomingViewController.swift
//  Netflix-Clone
//
//  Created by 7Peaks on 30/6/2565 BE.
//

import RxCocoa
import RxSwift
import UIKit

class UpcomingViewController: UIViewController {
    // MARK: Properties

    private lazy var viewModel: UpcomingViewModel = .init()

    private let upcomingTableView: UITableView = {
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

        upcomingTableView.frame = view.bounds
    }

    // MARK: Methods

    func setup() {
        title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always

        view.addSubview(upcomingTableView)
        upcomingTableView.delegate = self
//        upcomingTableView.dataSource = self

        bindingData()
    }

    func bindingData() {
        viewModel.upcomingPublisher.asObserver().bind(to: upcomingTableView.rx.items(cellIdentifier: UpcomingTableViewCell.identifier)) { (_: Int, movie: TitleMovie, cell: UpcomingTableViewCell) in
            cell.configure(with: movie)
        }.disposed(by: viewModel.disposeBag)

        viewModel.getUpcomingMovies()
    }
}

// MARK: Extensions

extension UpcomingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
