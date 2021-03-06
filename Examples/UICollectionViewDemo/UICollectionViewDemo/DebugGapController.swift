//
//  ViewController.swift
//  UICollectionViewDemo
//
//  Created by 伯驹 黄 on 2016/11/28.
//  Copyright © 2016年 伯驹 黄. All rights reserved.
//

import UIKit

class DebugGapController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        var rect = self.view.frame
        
        let layout = UICollectionViewFlowLayout()
        let width = layout.fixSlit(rect: &rect, colCount: 3, space: 1)
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1

        let collectionView = UICollectionView(frame: rect, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DebugGapController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    }
}

extension DebugGapController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white: 0.7, alpha: 1)
    }
}

