//
//  SearchResultViewController.swift
//  Netflix-Clone
//
//  Created by Nuttapon Buaban on 5/7/2565 BE.
//

import RxCocoa
import RxSwift
import UIKit

class SearchResultViewController: UIViewController {
    // MARK: Properties

    lazy var viewModel: SearchResultViewModel = .init()

    private let searchResultCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 5
        let collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)

        return collectionView
    }()

    // MARK: Init

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        searchResultCollectionView.frame = view.bounds
    }

    // MARK: Methods

    func setup() {
        view.addSubview(searchResultCollectionView)

        bindingData()
    }

    func bindingData() {
        // binding
        viewModel.resultPublisher.bind(to: searchResultCollectionView.rx.items(cellIdentifier: TitleCollectionViewCell.identifier)) { (_: Int, movie: TitleMovie, cell: TitleCollectionViewCell) in
            cell.configure(with: movie.posterPath ?? "")
        }.disposed(by: viewModel.disposeBag)
    }
}
