//
//  HomeViewController.swift
//  Netflix-Clone
//
//  Created by 7Peaks on 30/6/2565 BE.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: Properties

    lazy var viewModel: HomeViewModel = .init()

    let sectionTitles: [String] = ["Trending Movies", "Popular", "Trending TV", "Upcoming Movies", "Top rated"]

    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.showsVerticalScrollIndicator = false
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    // MARK: Init & Override func.

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }

    // MARK: Methods

    func setup() {
        view.addSubview(homeFeedTable)

        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self

        homeFeedTable.tableHeaderView = HeroHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))

        configureNavbar()
    }

    private func configureNavbar() {
        let image = UIImage(named: "Logo")?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)

        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .white

        navigationController?.hidesBarsOnSwipe = true
    }
}

// MARK: Extensions

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }

        switch indexPath.section {
        case HomeSections.TrendingMovies.rawValue:
            viewModel.getTrendingMovies { success, titles, _ in
                if success {
                    cell.configure(with: titles!)
                }
            }
        case HomeSections.Popular.rawValue:
            viewModel.getPopularMovies { success, titles, _ in
                if success {
                    cell.configure(with: titles!)
                }
            }
        case HomeSections.TrendingTv.rawValue:
            viewModel.getTrendingTv { success, titles, _ in
                if success {
                    cell.configure(with: titles!)
                }
            }
        case HomeSections.Upcoming.rawValue:
            viewModel.getUpcomingMovies { success, titles, _ in
                if success {
                    cell.configure(with: titles!)
                }
            }
        case HomeSections.TopRated.rawValue:
            viewModel.getTopRated { success, titles, _ in
                if success {
                    cell.configure(with: titles!)
                }
            }
        default:
            return UITableViewCell()
        }
        cell.delegate = self

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    // MARK: TableView Header

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalized
    }
}

extension HomeViewController: CollectionViewTableViewCellDelegate {
    func collectionViewTableViewCellDidTapCell(_ cell: CollectionViewTableViewCell, model: TitleMovie) {
        DispatchQueue.main.async { [unowned self] in
            let vc = MovieDetailViewController(model.id)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
