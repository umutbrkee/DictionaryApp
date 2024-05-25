//
//  DictionaryApi.swift
//  Dictionary
//
//  Created by Umut on 25.05.2024.
//

import Foundation
import DictionaryAPI
import UIKit
import CoreData

protocol SearchKeywordApi: AnyObject {
    func performSearch(with keyword: String?, success: @escaping (([DictionaryElement])->()), onError: @escaping (Error)->())
}

extension SearchKeywordApi {
    
    func performSearch(with keyword: String?, success: @escaping (([DictionaryElement])->()), onError: @escaping (Error)->()) {
        guard let keyword = keyword else { return }
        let dictionaryService = DictionaryService()
        dictionaryService.fetchDictionaryEntries(word: keyword) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let entries):
                DispatchQueue.main.async {
                    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                    let searchEntry = SearchEntry(context: context)
                    searchEntry.searchText = keyword
                    searchEntry.timestamp = Date()
                    do {
                        try context.save()
                    } catch {
                        print("Arama girişi kaydedilirken hata oluştu: \(error)")
                    }
//                    self.loadSearchEntries()
//                    let detailViewController = DetailViewController()
//                    let detailVM = DetailViewModel()
//                    detailVM.entries = entries
//                    detailViewController.viewModel = detailVM
                    success(entries)
//                    self.delegate?.push(vc: detailViewController)
                }
            case .failure(let error):
                onError(error)
//                self.delegate?.showAlert(error: error.localizedDescription)
            }
        }
    }
    }

