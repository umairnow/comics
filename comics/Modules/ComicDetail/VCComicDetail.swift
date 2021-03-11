//
//  VCComicDetail.swift
//  comics
//
//  Created by Umair Aamir on 14/02/2021.
//

import UIKit
import Moya
import AlamofireImage

protocol ComicDetailView {
    func refreshView(comic: Comic?)
    func loadingFailed()
}

class VCComicDetail: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var ivComic: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var viewMessage: UIView!

    // MARK: - View State
    private var state: State = .loading {
        didSet {
            switch state {
            case .ready:
                viewMessage.isHidden = true
            case .loading:
                viewMessage.isHidden = false
                activityIndicator.startAnimating()
                lblMessage.text = "Getting comics ..."
            case .error:
                viewMessage.isHidden = false
                lblMessage.text = """
                                    Something went wrong!
                                    Try again later.
                                  """
                activityIndicator.stopAnimating()
            }
        }
    }

    var interactor: ComicDetail.InteractorInput?


    override func viewDidLoad() {
        super.viewDidLoad()
        assemble()
        state = .loading
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

    func loadingFailed() {
        self.state = .error
    }
}

extension VCComicDetail {
    enum State {
        case loading
        case ready([Comic])
        case error
    }
}
