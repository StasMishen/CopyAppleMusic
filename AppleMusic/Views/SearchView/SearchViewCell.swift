//
//  SearchViewCell.swift
//  AppleMusic
//
//  Created by Стас on 17.06.2021.
//

import UIKit
import Foundation

struct Profile {
    let name: String
    let imageName: String
}

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

class ProfileCell: UICollectionViewCell {

    private enum Constants {


        // MARK: profileImageView layout constants
        static let imageHeight: CGFloat = 125.0

        // MARK: Generic layout constants
        static let verticalSpacing: CGFloat = 8.0
        static let horizontalPadding: CGFloat = 16.0
        static var profileDescriptionVerticalPadding: CGFloat = 30.0
    }

    private let profileImageView: UIImageView = {
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

        //let i = name.text?.count ?? 0

    }

    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.addSubview(profileImageView)
        contentView.addSubview(name)
    }



    private func setupLayouts() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false

        // Layout constraints for `profileImageView`
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight)
        ])

        // Layout constraints for `usernameLabel`
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.horizontalPadding),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.horizontalPadding),
            name.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -Constants.profileDescriptionVerticalPadding)
        ])

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with profile: Profile) {
        profileImageView.image = UIImage(named: profile.imageName)
        name.text = profile.name
    }
}


extension ProfileCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
