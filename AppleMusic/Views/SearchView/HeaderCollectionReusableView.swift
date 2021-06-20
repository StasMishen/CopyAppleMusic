//
//  HeaderCollectionReusableView.swift
//  AppleMusic
//
//  Created by Стас on 19.06.2021.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    static let identifier = "HeaderCollectionReusableView"

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Поиск по категориям"
        label.font = UIFont.boldSystemFont(ofSize: 22.0)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    

    public func configure() {
        addSubview(label)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
