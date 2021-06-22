//
//  SearchViewCell.swift
//  AppleMusic
//
//  Created by Стас on 17.06.2021.
//

import UIKit
import Foundation

struct Category {
    let name: String
    let imageName: String
}

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

class CategoryCell: UICollectionViewCell {
    
    private enum Constants {
        static let imageHeight: CGFloat = 125.0
        static let horizontalPadding: CGFloat = 16.0
        static var categoryDescriptionVerticalPadding: CGFloat = 30.0
    }
    
    private let categoryImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let name: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.addSubview(categoryImageView)
        contentView.addSubview(name)
    }
    
    private func setupLayouts() {
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryImageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight)
        ])
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.horizontalPadding),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.horizontalPadding),
            name.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: -Constants.categoryDescriptionVerticalPadding)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with category: Category) {
        categoryImageView.image = UIImage(named: category.imageName)
        name.text = category.name
    }
}

extension CategoryCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
