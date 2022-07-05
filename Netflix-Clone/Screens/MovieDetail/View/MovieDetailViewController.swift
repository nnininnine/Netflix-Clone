//
//  MovieDetailViewController.swift
//  Netflix-Clone
//
//  Created by Nuttapon Buaban on 5/7/2565 BE.
//

import UIKit

class MovieDetailViewController: UIViewController {
    // MARK: Properties

    private lazy var viewModel: MovieDetailViewModel = .init()

    // MARK: Init

    init(_ id: Int) {
        super.init(nibName: nil, bundle: nil)
        viewModel = .init(id)

        // tab bar setup
        hidesBottomBarWhenPushed = true
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setup()
    }

    // MARK: Methods

    func setupUI() {
        // nav bar setup
        navigationController?.hidesBarsOnSwipe = false
    }

    func setup() {
        print(viewModel.id)

        view.backgroundColor = .red
    }
}
