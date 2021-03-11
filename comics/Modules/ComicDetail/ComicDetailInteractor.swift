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
        view?.setLoadingState()
        provider.request(.comicByText(text)) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let response):
                do {
                    // This is a temporary implementation, it should be changed to handle a a response of comic list.
                    // Currently we are just showing first comic
                    let plainText = try response.mapString()
                    let comicNumbers = plainText.components(separatedBy: " ")
                    if (comicNumbers.count > 3) {
                        self.searchComicByNumber(number: comicNumbers[2].replacingOccurrences(of: "\n", with: "", options: NSString.CompareOptions.literal, range: nil))
                    }
                } catch {
                    self.view?.loadingFailed()
                }
            case .failure:
                self.view?.loadingFailed()
            }
        }
    }

    func searchComicByNumber(number: String) {
        view?.setLoadingState()
        provider.request(.comicByNumber(number)) { [weak self] result in
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

    func getCurrentComic() {
        view?.setLoadingState()
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
