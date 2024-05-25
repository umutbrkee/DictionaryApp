//
//  ViperSearchRouter.swift
//  Dictionary
//
//  Created by Umut on 25.05.2024.
//

import UIKit
import DictionaryAPI

class ViperSearchRouter {
     weak var view: UIViewController!
}

extension ViperSearchRouter: ViperSearchRouterInput {
    func show(modal: [DictionaryElement]) {
        let detailVC = ViperDetailRouter(dictionary: modal).getMainView()
        self.view.navigationController?.pushViewController(detailVC, animated: true)
    }
    

    
    
    var storyboardName: String {return "ViperSearch"}
    
    func getMainView() -> UIViewController {
        let service = ViperSearchService()
        let interactor = ViperSearchInteractor(service: service)
        let presenter = ViperSearchPresenter()
        let viewController = viewControllerFromStoryboard(of: ViperScreenViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
   
}
