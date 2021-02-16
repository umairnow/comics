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

    var interactor: ComicDetail.InteractorInput?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        assemble()
        interactor?.getCurrentComic()
    }

    private func assemble() {
        let interactor = ComicDetail.Interactor()
        interactor.view = self
        self.interactor = interactor
    }

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
