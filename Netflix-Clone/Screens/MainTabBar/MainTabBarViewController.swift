//
//  ViewController.swift
//  Netflix-Clone
//
//  Created by 7Peaks on 30/6/2565 BE.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    // MARK: Init

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        setup()
    }

    // MARK: Methods

    func setupUI() {
        view.backgroundColor = .systemBackground
    }

    func setup() {
        // declare VC properties
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let upcomingVC = UINavigationController(rootViewController: UpcomingViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let downloadVC = UINavigationController(rootViewController: DownloadsViewController())

        // set tabBarItem
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        upcomingVC.tabBarItem.image = UIImage(systemName: "play.circle")
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        downloadVC.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")

        // set title
        homeVC.title = "Home"
        upcomingVC.title = "Coming Soon"
        searchVC.title = "Top Search"
        downloadVC.title = "Downloads"

        tabBar.tintColor = .label

        setViewControllers([homeVC, upcomingVC, searchVC, downloadVC], animated: true)
    }
}
