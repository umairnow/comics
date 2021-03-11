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
}

extension ComicService: TargetType {

    public var baseURL: URL {
        URL(string: "http://xkcd.com")!
    }

    public var path: String {
        switch self {
        case .currentComic: return "/info.0.json"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .currentComic: return .get
        }
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
            return .requestParameters(
                    parameters: ["format": "comic"],
                    encoding: URLEncoding.default)
        }
    }

    public var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    public var validationType: ValidationType {
        .successCodes
    }
}
