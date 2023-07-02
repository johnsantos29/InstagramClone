//
//  IGFeedPostTableViewCell.swift
//  InstagramClone
//
//  Created by John Erick Santos on 2/7/2023.
//

import UIKit

final class IGFeedPostTableViewCell: UITableViewCell {
    static let identifier = "IGFeedPostTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
}
