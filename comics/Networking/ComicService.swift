//
//  ComicService.swift
//  comics
//
//  Created by Umair Aamir on 14/02/2021.
//

import Foundation
import Moya

public enum ComicService {
    case currentComic
    case comicByNumber(String)
    case comicByText(String)
}

extension ComicService: TargetType {

    public var baseURL: URL {
        switch self {
        case .comicByText(_):
            return URL(string: "https://relevantxkcd.appspot.com")!
        default:
            return URL(string: "http://xkcd.com")!
        }
    }

    public var path: String {
        switch self {
        case .currentComic: return "/info.0.json"
        case .comicByNumber(let number): return number + "/info.0.json"
        case .comicByText(_): return "/process"
        }
    }

    public var method: Moya.Method {
        .get
    }

    /*
      sampleData is used to provide a mocked/stubbed version of your API for testing.
   */
    public var sampleData: Data {
        Data()
    }

    public var task: Task {
        switch self {
        case .currentComic:
            return .requestParameters(parameters: ["": ""], encoding: URLEncoding.default)
        case .comicByNumber(_):
            return .requestParameters(parameters: ["": ""], encoding: URLEncoding.default)
        case .comicByText(let searchQuery):
            return .requestParameters(parameters: ["action": "xkcd", "query": searchQuery], encoding: URLEncoding.queryString)
        }
    }

    public var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    public var validationType: ValidationType {
        .successCodes
    }
}
