//
//  SearchViewUIKit.swift
//  AppleMusic
//
//  Created by Стас on 17.06.2021.
//

import UIKit
import SwiftUI

class SearchViewUIKit: UIViewController {
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 12.0
        static let itemHeight: CGFloat = 125.0
        static let zero: CGFloat = 0.0
    }
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchBar = UISearchController()
        navigationItem.hidesSearchBarWhenScrolling = true
        searchBar.searchBar.placeholder = "Ваша Медиатека"
        navigationItem.searchController = searchBar
        navigationController?.navigationBar.barTintColor = .white
        title = "Поиск"
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collectionView.showsVerticalScrollIndicator = false
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        view.addSubview(collectionView)
    }
    
    private func setupLayouts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -65),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -43)
        ])
    }
}

extension SearchViewUIKit: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Categories.item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CategoryCell
        let category = Categories.item[indexPath.row]
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
        return UIEdgeInsets(top: LayoutConstant.spacing, left: LayoutConstant.zero, bottom: LayoutConstant.spacing, right: LayoutConstant.zero)
    }
    
    // Расстояние между строками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
    
    // Расстояние между элементами
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
    // Заголовок коллекции
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
        header.configure()
        return header
    }
    // Размеры заголовка коллекции
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 35)
    }
}

struct SomeView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        let navVC = UINavigationController(rootViewController: SearchViewUIKit())
        navVC.navigationBar.prefersLargeTitles = true
        return navVC
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}
