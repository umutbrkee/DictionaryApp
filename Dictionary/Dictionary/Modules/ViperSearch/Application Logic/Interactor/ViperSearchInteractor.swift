//
//  ViperSearchInteractor.swift
//  Dictionary
//
//  Created by Umut on 25.05.2024.
//

import Foundation
import CoreData
import UIKit

class ViperSearchInteractor {
    
	// MARK: Properties
    
    weak var output: ViperSearchInteractorOutput?
    private let service: ViperSearchServiceType
    var searchEntries:[SearchEntry] = []
    // MARK: Initialization
    
    init(service: ViperSearchServiceType) {
        self.service = service
    }
    
    func loadSearchEntries() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<SearchEntry> = SearchEntry.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "timestamp", ascending: false)]
        do {
            let fetchedEntries = try context.fetch(fetchRequest)
            var uniqueEntries: [SearchEntry] = []
            var searchTextSet: Set<String> = Set()
            var count = 0
            for entry in fetchedEntries {
                if !searchTextSet.contains(entry.searchText ?? "") {
                    uniqueEntries.append(entry)
                    searchTextSet.insert(entry.searchText ?? "")
                    count += 1
                }
                
                if count >= 5 {
                    break
                }
            }
            searchEntries = uniqueEntries
        } catch {
            print("Arama girişleri yüklenirken hata oluştu: \(error)")
        }
    }
    // MARK: Converting entities
    
}

// MARK: ViperSearch interactor input interface

extension ViperSearchInteractor: ViperSearchInteractorInput {
    func getSearchEntries() {
        self.loadSearchEntries()
        self.output?.showSearch(entries: self.searchEntries)
    }
    
    func searchingText(text: String) {
        self.service.performSearch(with: text) {[weak self] entries in
            guard let self = self else {return}
            self.loadSearchEntries()
            self.output?.goToDetailView(modal: entries)
        } onError: { [weak self] error in
            guard let self = self else {return}
            self.output?.showObtained(error: error.localizedDescription)
        }

    }
    
    
}
