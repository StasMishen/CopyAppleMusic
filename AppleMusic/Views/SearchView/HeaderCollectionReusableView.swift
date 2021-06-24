//
//  HeaderCollectionReusableView.swift
//  AppleMusic
//
//  Created by Стас on 19.06.2021.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionReusableView"
    
    private let imageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 500, height: 1))
        image.image = UIImage(named: "divider")
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Поиск по категориям"
        label.font = UIFont.boldSystemFont(ofSize: 22.0)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    public func configure() {
        addSubview(imageView)
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 2),
            imageView.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -8)
        ])
    }
}
