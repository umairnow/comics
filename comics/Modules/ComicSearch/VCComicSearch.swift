//
//  VCComicSearch.swift
//  comics
//
//  Created by Umair Aamir on 13/02/2021.
//

import UIKit

class VCComicSearch: UIViewController {
    
    @IBOutlet weak var scSearchType: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension VCComicSearch : UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if (self.scSearchType.selectedSegmentIndex == 0) {
            
        }
    }
}

