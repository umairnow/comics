//
//  Comic.swift
//  comics
//
//  Created by Umair Aamir on 15/02/2021.
//

import Foundation

struct Comic: Codable {
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

    var date: String! {
        get {
            day + "/" + month + "/" + year
        }
    }
}

