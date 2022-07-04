//
//  UpcomingTableViewCell.swift
//  Netflix-Clone
//
//  Created by Nuttapon Buaban on 4/7/2565 BE.
//

import Nuke
import RxSwift
import UIKit

class UpcomingTableViewCell: UITableViewCell {
    // MARK: Outlets

    @IBOutlet private var movieTitleLabel: UILabel!
    @IBOutlet private var movieImageView: UIImageView!
    @IBOutlet private var playButton: UIButton!

    // MARK: Properties

    static let identifier = "UpcomingTableViewCell"
    private var movie: TitleMovie?
    private let disposeBag: DisposeBag = .init()

    // MARK: Init

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        selectionStyle = .none
    }

    // MARK: Methods

    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    func setup() {
        playButton.rx.tap.asObservable().subscribe(onNext: { [weak self] in
            guard let movie = self?.movie else { return }
            print("on tap: \(movie.originalTitle ?? "")")
        }).disposed(by: disposeBag)
    }

    func configure(with movie: TitleMovie) {
        self.movie = movie
        movieTitleLabel.text = movie.originalTitle ?? ""

        guard let url = URL(string: Constants.baseImgUrl + (movie.posterPath ?? "")) else { return }
        Nuke.loadImage(with: url, into: movieImageView)
    }
}
