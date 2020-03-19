//
//  CollectionViewController.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit
import SnapKit

class CollectionViewController: BaseViewController {

    var presenter: CollectionPresenterProtocol!
    private var collectionView: UICollectionView! = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    private let collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    private var dataSource: ItemsDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
        self.presenter.viewLoaded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.title = "Collection"
    }

    private func createUI() {
        
        let itemCellSize = CGSize(width: 150.withRatio(), height: 150.withRatio())
        self.collectionViewLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        self.collectionViewLayout.itemSize = itemCellSize
        self.collectionViewLayout.sectionInset = UIEdgeInsets(top: 15.withRatio(), left: 15.withRatio(), bottom: 15.withRatio(), right: 15.withRatio())
        self.collectionViewLayout.minimumLineSpacing = 20.withRatio()
        self.collectionViewLayout.minimumInteritemSpacing = 20.withRatio()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.setCollectionViewLayout(self.collectionViewLayout, animated: true)
        self.collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: "itemCell")
        self.collectionView.backgroundColor = UIColor.white
        self.collectionViewLayout.scrollDirection = .vertical;

        
        self.dataSource = ItemsDataSource()
        self.dataSource.delegate = self
        
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.top.bottom.right.left.equalToSuperview()
        }
    }
    
    func insertModels(models: [ItemData]) {
        self.dataSource.insertItems(models)
    }
    
    deinit {
        self.presenter = nil
        self.collectionView = nil
        self.dataSource = nil
    }
    
}

extension CollectionViewController: CollectionViewProtocol {
    func getModelBy(index: Int) -> ItemData? {
        return self.dataSource.getModelBy(index: index)
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.getNumberOfItems(at: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.dataSource.getCell(for: collectionView, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter.didClickCellAt(row: indexPath.row)
    }
    
}

extension CollectionViewController: ItemsDataSourceDelegate {
    func reloadData() {
        self.collectionView.reloadData()
    }
}
