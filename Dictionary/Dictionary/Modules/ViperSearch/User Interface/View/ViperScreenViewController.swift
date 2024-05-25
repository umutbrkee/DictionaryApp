//
//  ViperScreenViewController.swift
//  Dictionary
//
//  Created by Umut on 25.05.2024.
//
import UIKit

class ViperScreenViewController: UIViewController, SearchViewProtocol {
   
    
    var presenter: ViperSearchModuleInterface?
    var searchVC: SearchViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        searchVC = SearchViewController()
        
        guard let vc = searchVC else {
            fatalError("unable to instantite childviewcontroller")
        }
        addChild(vc)
        vc.view.frame = self.view.bounds
        vc.view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        self.view.addSubview(vc.view)

        self.didMove(toParent: self)
        vc.searchViewDelegate = self
        self.presenter?.loadingSearchEntries()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.loadingSearchEntries()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func didPress(text: String) {
        presenter?.viewDidPress(text: text)
    }
}
// MARK: SearchViewInterface
extension ViperScreenViewController: ViperSearchViewInterface {
    func show(entries: [SearchEntry]) {
        self.searchVC?.load(entries: entries)
    }
    
    func show(error: String) {
        DispatchQueue.main.async { [weak self] in
            if let viewController = self {
                Alert.showAlert(alertTitle: "Error", alertMessage: "Kelime Bulunamadi.", defaultTitle: "OK", viewController: viewController)
            }
            print("Hata oluştu: \(error)")
        }
    }
    
    
}
