//
//  Extensions.swift
//  InstagramClone
//
//  Created by John Erick Santos on 19/6/2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
