//
//  ViperDetailRouter.swift
//  Dictionary
//
//  Created by Umut on 25.05.2024.
//

import UIKit
import DictionaryAPI

class ViperDetailRouter {
     weak var view: UIViewController!
    var dict:[DictionaryElement] = []
    init(dictionary: [DictionaryElement]) {
        self.dict = dictionary
    }
}

extension ViperDetailRouter: ViperDetailRouterInput {
    
    var storyboardName: String {return "ViperDetail"}
    
    func getMainView() -> UIViewController {
        let service = ViperDetailService()
        let interactor = ViperDetailInteractor(service: service)
        interactor.dict = self.dict
        let presenter = ViperDetailPresenter()
        let viewController = viewControllerFromStoryboard(of: ViperDetailViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
}
