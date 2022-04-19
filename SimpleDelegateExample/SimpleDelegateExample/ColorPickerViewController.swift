//
//  ColorPickerViewController.swift
//  SimpleDelegateExample
//
//  Created by Kade Walter on 4/18/22.
//

import UIKit

protocol ColorSelectedDelegate: AnyObject {
    func colorSelected(withColor color: UIColor)
}

class ColorPickerViewController: UIViewController, UICollectionViewDelegate {
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, UIColor>!
    
    weak var colorSelectedDelegate: ColorSelectedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()
        self.collectionView.delegate = self
    }
    
    private func configureCollectionView() {
        self.collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(44))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        let spacing = CGFloat(10.0)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewCell, UIColor> { (cell, indexPath, color) in
            // Populate the cell with our item description.
            cell.contentView.backgroundColor = color
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, UIColor>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, color: UIColor) -> UICollectionViewCell? in
            // Return the cell.
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: color)
        }

        // initial data
        var snapshot = NSDiffableDataSourceSnapshot<Section, UIColor>()
        snapshot.appendSections([.main])
        snapshot.appendItems([
            .green,
            .blue,
            .purple,
            .red,
            .yellow,
            .orange
        ])
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        guard let color = self.dataSource.itemIdentifier(for: indexPath) else { return }
        colorSelectedDelegate?.colorSelected(withColor: color)
        self.navigationController?.popViewController(animated: true)
    }
    
    enum Section {
        case main
    }
}
