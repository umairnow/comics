//
//  VCComicDetail.swift
//  comics
//
//  Created by Umair Aamir on 14/02/2021.
//

import UIKit
import AlamofireImage

protocol ComicDetailView {
    func refreshView(comic: Comic?)
}

class VCComicDetail: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var ivComic: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension VCComicDetail: ComicDetail.View {
    func refreshView(comic: Comic?) {
        guard let c = comic else {
            return
        }
        lblTitle.text = c.title
        lblDate.text = c.date
        lblDescription.text = c.alt
        guard let url = URL(string: c.img) else {
            return
        }
        ivComic.af.setImage(withURL: url)

    }
}
