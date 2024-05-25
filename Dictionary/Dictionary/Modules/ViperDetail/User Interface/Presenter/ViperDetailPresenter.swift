//
//  ViperDetailPresenter.swift
//  Dictionary
//
//  Created by Umut on 25.05.2024.
//

import Foundation
import DictionaryAPI

class ViperDetailPresenter {
    
	// MARK: Properties
    
    weak var view: ViperDetailViewInterface?
    var interactor: ViperDetailInteractorInput?
    var wireframe: ViperDetailRouterInput?

    // MARK: Converting entities
    func convert(dict: [DictionaryElement]) -> DetailViewModel {
        let viewModal = DetailViewModel()
        viewModal.entries = dict
        return viewModal
    }
}

 // MARK: ViperDetail module interface

extension ViperDetailPresenter: ViperDetailModuleInterface {
    func getData() {
        self.interactor?.dictionaryData()
    }
    
    
}

// MARK: ViperDetail interactor output interface

extension ViperDetailPresenter: ViperDetailInteractorOutput {
    func obtained(dict: [DictionaryElement]) {
        let detailVM = self.convert(dict: dict)
        self.view?.load(dict: detailVM)
    }
    
    
}
