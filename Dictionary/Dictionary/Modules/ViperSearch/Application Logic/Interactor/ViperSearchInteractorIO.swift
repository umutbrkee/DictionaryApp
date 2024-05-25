//
//  ViperSearchInteractorIO.swift
//  Dictionary
//
//  Created by Umut on 25.05.2024.
//
import DictionaryAPI
import CoreData

protocol ViperSearchInteractorInput: AnyObject {
    func searchingText(text:String)
    func getSearchEntries()
}

protocol ViperSearchInteractorOutput: AnyObject {
    func showObtained(error: String)
    func goToDetailView(modal: [DictionaryElement])
    func showSearch(entries:[SearchEntry])
}
