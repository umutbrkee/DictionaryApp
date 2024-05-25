//
//  ViperSearchRouterInput.swift
//  Dictionary
//
//  Created by Umut on 25.05.2024.
//

import Foundation
import DictionaryAPI

protocol ViperSearchRouterInput: RouterInput {
    func show(modal: [DictionaryElement])
}
