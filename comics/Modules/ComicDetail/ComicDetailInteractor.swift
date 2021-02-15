//
//  ComicDetailInteractor.swift
//  comics
//
//  Created by Umair Aamir on 15/02/2021.
//

import Foundation

protocol ComicDetailInteractorInput {
    func getCurrentComic()
}

class ComicDetailInteractor {
    var view: ComicDetail.View?
    var service: ComicService?
}

extension ComicDetailInteractor: ComicDetailInteractorInput {
    func getCurrentComic() {
        // TO-DO: Call get current comic api http://xkcd.com/info.0.json
    }
}

extension ComicDetailInteractor: ComicDetail.Response {
    func onSuccessResponse(comic: Comic?) {
        view?.refreshView(comic: comic)
    }

    func onFailure(error: Error?) {
        // TO-DO: Show alert
    }
}
