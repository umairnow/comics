//
//  Comic.swift
//  comics
//
//  Created by Umair Aamir on 15/02/2021.
//

import Foundation
import ObjectMapper

struct Comic: Mappable {
    var month: String!
    var link: String?
    var year: String!
    var news: String?
    var safeTitle: String!
    var transcript: String?
    var alt: String!
    var img: String!
    var title: String!
    var day: String!

    // MARK: JSON
    init?(map: Map) { }

    mutating func mapping(map: Map) {
        month <- map["month"]
        link <- map["link"]
        year <- map["year"]
        news <- map["news"]
        safeTitle <- map["safeTitle"]
        transcript <- map["transcript"]
        alt <- map["alt"]
        img <- map["img"]
        title <- map["title"]
        day <- map["day"]
    }
}
