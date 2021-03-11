//
//  ComicDetailInteractor.swift
//  comics
//
//  Created by Umair Aamir on 15/02/2021.
//

import Foundation
import Moya

protocol ComicDetailInteractorInput {
    func getCurrentComic()
    func searchComicByText(text: String)
    func searchComicByNumber(number: String)
}

class ComicDetailInteractor {
    var view: ComicDetail.View?
    var service: ComicService?
    let provider = MoyaProvider<ComicService>()
}

extension ComicDetailInteractor: ComicDetailInteractorInput {
    func searchComicByText(text: String) {
        // TO-DO: Call search by text api https://relevantxkcd.appspot.com/process?action=xkcd&query=english
    }

    func searchComicByNumber(number: String) {
        // TO-DO: Call search by number api http://xkcd.com/614/info.0.json
    }

    func getCurrentComic() {
        provider.request(.currentComic) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let response):
                do {
                    self.view?.refreshView(comic: try response.map(Comic.self))
                } catch {
                    self.view?.loadingFailed()
                }
            case .failure:
                self.view?.loadingFailed()
            }
        }
    }
}
