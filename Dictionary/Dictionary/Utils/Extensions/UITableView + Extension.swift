//
//  UITableView + Extension.swift
//  Dictionary
//
//  Created by Umut on 25.05.2024.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(cellClass: T.Type) {
        let className = String(describing: T.self)
        self.register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: className)
    }
}
