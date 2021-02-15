//
//  ComicService.swift
//  comics
//
//  Created by Umair Aamir on 14/02/2021.
//

enum ComicService {
    case currentComic(Void)
    case searchByText(query: String?)
    case searchByNumber(number: Int)
}

protocol ComicServiceOutput {
    func onSuccessResponse(comic: Comic?)
    func onFailure(error: Error?)
}
