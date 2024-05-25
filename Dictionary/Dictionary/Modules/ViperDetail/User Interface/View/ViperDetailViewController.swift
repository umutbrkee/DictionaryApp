//
//  ViperDetailViewController.swift
//  Dictionary
//
//  Created by Umut on 25.05.2024.
//

import UIKit

class ViperDetailViewController: UIViewController {
    
    // MARK: Properties
    var detailVC: DetailViewController?
    var presenter: ViperDetailModuleInterface?
    
    // MARK: IBOutlets
    
    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        self.detailVC = DetailViewController()
        self.loadData()
        self.setup()
       
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
        guard let detailVC = self.detailVC else {return}
        self.addChild(detailVC)
        detailVC.view.frame = self.view.bounds
        detailVC.view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        self.view.addSubview(detailVC.view)
        self.didMove(toParent: self)
    }
    private func loadData() {
        self.presenter?.getData()
    }
}

// MARK: ViperDetailViewInterface
extension ViperDetailViewController: ViperDetailViewInterface {
    func load(dict: DetailViewModel) {
        self.detailVC?.viewModel = dict
    }
    
    
}
