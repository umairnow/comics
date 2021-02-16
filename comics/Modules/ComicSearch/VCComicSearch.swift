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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailController = segue.destination as? VCComicDetail else {
            return
        }
        interactor = detailController.interactor
    }

    @IBAction func onSegmentedControlChanged(_ sender: UISegmentedControl) {
        comicSearchBar.text = ""
    }
}

extension VCComicSearch : UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }
        if (scSearchType.selectedSegmentIndex == 0) {
            interactor?.searchComicByText(text: text)
        } else {
            interactor?.searchComicByNumber(number: text)
        }
    }
}

