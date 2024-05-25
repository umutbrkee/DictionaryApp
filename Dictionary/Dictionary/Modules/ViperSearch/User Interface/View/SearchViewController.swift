//
//  SearchViewController.swift
//  Dictionary
//
//  Created by Umut on 25.05.2024.
//

import UIKit
import CoreData
protocol SearchViewProtocol: AnyObject {
    func didPress(text:String)
}
class SearchViewController: UIViewController {
   
    
    // MARK: - IBOUTLETS
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var button: UIButton!
    
    // MARK: - PROPERTIES
    var searchEntry:[SearchEntry] = []
    weak var searchViewDelegate: SearchViewProtocol?
    var keyboardHeight:CGFloat = 0.0
    // MARK: - OVERRIDE FUNCTIONS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.register(cellClass: SearchCell.self)
        searchBar.returnKeyType = .done
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchBar.resignFirstResponder()
    }
    func load(entries: [SearchEntry]) {
        self.searchEntry = entries
        self.tableView.reloadData()
    }
    // MARK: - PRIVATE FUNCTIONS
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.keyboardHeight = keyboardSize.height
            UIView.animate(withDuration: 0.3) {
                self.button.transform = CGAffineTransform(translationX: 0, y: -self.keyboardHeight)
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.button.transform = .identity
        }
    }
    
    @IBAction private func searchButtonTapped(_ sender: Any) {
        guard let keyword = searchBar.text else {
            return
        }
//        viewModel.performSearch(with: keyword)
        self.searchViewDelegate?.didPress(text: keyword)
    }
}

// MARK: - UISEARCHBARDELEGATE

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        UIView.animate(withDuration: 0.3) {
            self.button.transform = CGAffineTransform(translationX: 0, y: -self.keyboardHeight)
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        UIView.animate(withDuration: 0.3) {
            self.button.transform = .identity
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

//MARK: - UITABLEVIEWDATASOURCE&DELEGATE

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchEntry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.identifier, for: indexPath) as! SearchCell
        let searchEntry = self.searchEntry[indexPath.row]
        cell.titleLabel.text = searchEntry.searchText
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchEntry = self.searchEntry[indexPath.row]
        let keyword = searchEntry.searchText
        guard let keyword = keyword else {return}
        self.searchViewDelegate?.didPress(text: keyword)
    }
}



