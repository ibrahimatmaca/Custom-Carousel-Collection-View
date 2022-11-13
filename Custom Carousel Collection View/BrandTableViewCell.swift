//
//  BrandTableViewCell.swift
//  Custom Carousel Collection View
//
//  Created by İbrahim Atmaca on 13.11.2022.
//

import UIKit

struct BrandTableViewCellViewModel {
    let viewModel: [TileCollectionViewCellViewModel]
}


class BrandTableViewCell: UITableViewCell {
    
    static let identifier = "BrandTableViewCell"
    
    private var viewModels: [TileCollectionViewCellViewModel] = []
    
    private let brandCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.register(TileCollectionViewCell.self, forCellWithReuseIdentifier: TileCollectionViewCell.identifier)
        
        collectionView.backgroundColor = .systemBackground
        
        return collectionView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemRed
        contentView.addSubview(brandCollectionView)
        brandCollectionView.delegate = self
        brandCollectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        brandCollectionView.frame = contentView.bounds
    }
    
    func configure(with viewModel: BrandTableViewCellViewModel){
        self.viewModels = viewModel.viewModel
        brandCollectionView.reloadData()
    }
    
}

// MARK: - CollectionView
extension BrandTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TileCollectionViewCell.identifier,
            for: indexPath
        ) as? TileCollectionViewCell else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = contentView.frame.size.width / 3
        return CGSize(width: width, height: width)
    }
    
}
