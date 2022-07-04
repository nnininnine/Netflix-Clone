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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
//        upcomingTableView.delegate = self
//        upcomingTableView.dataSource = self

        bindingData()
    }

    func bindingData() {
        viewModel.upcomingPublisher.bind(to: upcomingTableView.rx.items(cellIdentifier: "cell")) { [weak self] (index: Int, movie: TitleMovie, cell: UITableViewCell) in
            cell.textLabel?.text = movie.originalTitle ?? ""
        }.disposed(by: viewModel.disposeBag)
        
        viewModel.getUpcomingMovies()
    }
}

// MARK: Extensions

// extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = indexPath.row.description
//        return cell
//    }
// }
