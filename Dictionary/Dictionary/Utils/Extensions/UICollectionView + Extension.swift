//
//  UICollectionView + Extension.swift
//  Dictionary
//
//  Created by Umut on 25.05.2024.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(cellClass: T.Type) {
        let className = String(describing: T.self)
        self.register(UINib(nibName: className, bundle: nil), forCellWithReuseIdentifier: className)
    }
}
