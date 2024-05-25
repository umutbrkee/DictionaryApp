//
//  ViperDetailInteractor.swift
//  Dictionary
//
//  Created by Umut on 25.05.2024.
//

import Foundation
import DictionaryAPI

class ViperDetailInteractor {
    
	// MARK: Properties
    var dict:[DictionaryElement] = []
    weak var output: ViperDetailInteractorOutput?
    private let service: ViperDetailServiceType
    
    // MARK: Initialization
    
    init(service: ViperDetailServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: ViperDetail interactor input interface

extension ViperDetailInteractor: ViperDetailInteractorInput {
    func dictionaryData() {
        self.output?.obtained(dict: self.dict)
    }
    
    
}
