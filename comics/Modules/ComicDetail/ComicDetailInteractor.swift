//
//  ComicDetailInteractor.swift
//  comics
//
//  Created by Umair Aamir on 15/02/2021.
//

import Foundation

protocol ComicDetailInteractorInput {
    func getCurrentComic()
    func searchComicByText(text: String)
    func searchComicByNumber(number: String)
}

class ComicDetailInteractor {
    var view: ComicDetail.View?
    var service: ComicService?
}

extension ComicDetailInteractor: ComicDetailInteractorInput {
    func searchComicByText(text: String) {
        // TO-DO: Call search by text api https://relevantxkcd.appspot.com/process?action=xkcd&query=english
    }
    
    func searchComicByNumber(number: String) {
        // TO-DO: Call search by number api http://xkcd.com/614/info.0.json
    }
    
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
