//
//  ViperDetailInteractorIO.swift
//  Dictionary
//
//  Created by Umut on 25.05.2024.
//
import DictionaryAPI

protocol ViperDetailInteractorInput: AnyObject {
    func dictionaryData()
}

protocol ViperDetailInteractorOutput: AnyObject {
    func obtained(dict: [DictionaryElement])
}
