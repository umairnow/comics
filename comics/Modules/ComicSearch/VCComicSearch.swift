//
//  VCComicSearch.swift
//  comics
//
//  Created by Umair Aamir on 13/02/2021.
//

import UIKit

class VCComicSearch: UIViewController {
    
    @IBOutlet weak var scSearchType: UISegmentedControl!
    @IBOutlet weak var comicSearchBar: UISearchBar!
    var interactor: ComicDetail.InteractorInput?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSegmentedControlChanged(_ sender: UISegmentedControl) {
        comicSearchBar.text = ""
    }
}

extension VCComicSearch : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.comicSearchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }
        if (scSearchType.selectedSegmentIndex == 0 && text != "") {
            interactor?.searchComicByText(text: text)
        } else {
            interactor?.searchComicByNumber(number: text)
        }
    }
}

