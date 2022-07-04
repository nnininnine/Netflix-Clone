//
//  TitleCollectionViewCell.swift
//  Netflix-Clone
//
//  Created by Nuttapon Buaban on 1/7/2565 BE.
//

import Nuke
import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    // MARK: Properties

    static let identifier = "TitleCollectionViewCell"

    private let posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    // MARK: Init

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        posterImage.frame = contentView.bounds
    }

    // MARK: Methods

    func setup() {
        contentView.addSubview(posterImage)
    }

    func configure(with model: String) {
        guard let url = URL(string: Constants.baseImgUrl + model) else { return }

        Nuke.loadImage(with: url, into: posterImage)
    }
}
