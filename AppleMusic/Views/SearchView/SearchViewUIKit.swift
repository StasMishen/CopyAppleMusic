//
//  SearchViewUIKit.swift
//  AppleMusic
//
//  Created by Стас on 17.06.2021.
//

import UIKit

class SearchViewUIKit: UIViewController {

    private enum LayoutConstant {
        static let spacing: CGFloat = 12.0
        static let itemHeight: CGFloat = 125.0
    }

    private let titleLarge: UILabel = {
        var title = UILabel()
        title.text = "Поиск"
        title.font = UIFont.boldSystemFont(ofSize: 32.0)
        title.textAlignment = .left
        title.textColor = .black
        return title
    }()

    private let searchBar: UISearchBar = {
        var title = UISearchBar()
        title.placeholder = "Ваша Медиатека"
        title.backgroundImage = UIImage()
        return title
    }()

    private let imageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 500, height: 1))
        image.image = UIImage(named: "divider")
        return image
    }()
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collectionView.showsVerticalScrollIndicator = false
        setupViews()
        setupLayouts()
        populateCategory()
    }
    
    private func setupViews() {
        view.addSubview(titleLarge)
        view.addSubview(searchBar)
        view.addSubview(imageView)
        view.addSubview(collectionView)
    }
    
    private func setupLayouts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        titleLarge.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLarge.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLarge.bottomAnchor.constraint(equalTo: searchBar.topAnchor),
            titleLarge.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 23),
            titleLarge.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -23),
            titleLarge.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: titleLarge.bottomAnchor),
            searchBar.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -5),
            searchBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 14),
            searchBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -14),
            searchBar.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -28)
        ])
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            imageView.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -7),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 23),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -23),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50)
        ])
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -65),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 23),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -23),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -33)
        ])
    }
}

extension SearchViewUIKit: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        let category = categories[indexPath.row]
        cell.setup(with: category)
        return cell
    }
}

extension SearchViewUIKit: UICollectionViewDelegateFlowLayout {
    // Размер ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = itemWidth(for: view.frame.width, spacing: LayoutConstant.spacing)
        return CGSize(width: width, height: LayoutConstant.itemHeight)
    }
    
    // Функция расчета размера ячейки в зависимости от количества в строке
    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 2
        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow - 10
        return floor(finalWidth)
    }
    
    // Поля для содержимого ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: LayoutConstant.spacing, left: 0, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
    }
    
    // Расстояние между строками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
    
    // Расстояние между элементами
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing - 15
    }
    // Заголовок коллекции
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
        header.configure()
        return header
    }
    // Размеры заголовка коллекции
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 30)
    }
}
