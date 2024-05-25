//
//  ViperSearchPresenter.swift
//  Dictionary
//
//  Created by Umut on 25.05.2024.
//

import Foundation
import DictionaryAPI

class ViperSearchPresenter {
    
	// MARK: Properties
    
    weak var view: ViperSearchViewInterface?
    var interactor: ViperSearchInteractorInput?
    var wireframe: ViperSearchRouterInput?

    // MARK: Converting entities
}

 // MARK: ViperSearch module interface

extension ViperSearchPresenter: ViperSearchModuleInterface {
    func loadingSearchEntries() {
        self.interactor?.getSearchEntries()
    }
    
    func viewDidPress(text: String) {
        interactor?.searchingText(text: text)
    }
}

// MARK: ViperSearch interactor output interface

extension ViperSearchPresenter: ViperSearchInteractorOutput {
    func showSearch(entries: [SearchEntry]) {
        self.view?.show(entries: entries)
    }
    
    func goToDetailView(modal: [DictionaryElement]) {
        self.wireframe?.show(modal: modal)
    }
    
  
    
    func showObtained(error: String) {
        self.view?.show(error: error)
    }
    
    
}
