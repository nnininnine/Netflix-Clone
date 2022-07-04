//
//  UpcomingTableViewCell.swift
//  Netflix-Clone
//
//  Created by Nuttapon Buaban on 4/7/2565 BE.
//

import UIKit

class UpcomingTableViewCell: UITableViewCell {
    // MARK: Outlets

    @IBOutlet private var movieTitleLabel: UILabel!
    @IBOutlet private var movieImageView: UIImageView!
    @IBOutlet private var playButton: UIButton!

    // MARK: Properties

    static let identifier = "UpcomingTableViewCell"

    // MARK: Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {}
}
