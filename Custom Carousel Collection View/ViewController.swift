//
//  ViewController.swift
//  Custom Carousel Collection View
//
//  Created by İbrahim Atmaca on 13.11.2022.
//

import UIKit

class ViewController: UIViewController {

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(BrandTableViewCell.self, forCellReuseIdentifier: BrandTableViewCell.identifier)
        
        return table
    }()
    
    private let viewModels: [BrandTableViewCellViewModel] = [
        BrandTableViewCellViewModel(
            viewModel: [
                TileCollectionViewCellViewModel(name: "Apple", backgroundColor: .systemGray),
                TileCollectionViewCellViewModel(name: "Google", backgroundColor: .systemBlue),
                TileCollectionViewCellViewModel(name: "Yemeksepeti", backgroundColor: .systemCyan),
                TileCollectionViewCellViewModel(name: "Deneme12", backgroundColor: .systemRed),
                TileCollectionViewCellViewModel(name: "Deneme123", backgroundColor: .systemTeal),
                TileCollectionViewCellViewModel(name: "Getir", backgroundColor: .systemBlue),
                TileCollectionViewCellViewModel(name: "Deneme", backgroundColor: .systemBrown)
            ]
        )
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BrandTableViewCell.identifier,
            for: indexPath
        ) as? BrandTableViewCell else {
            fatalError()
        }
        
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width / 2
    }
}

