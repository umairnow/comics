//
//  Comic.swift
//  comics
//
//  Created by Umair Aamir on 15/02/2021.
//

import Foundation

struct Comic: Codable {
    var month: String!
    var year: String!
    var day: String!
    var num: Int!
    var alt: String! // description
    var img: String!
    var title: String!

    var date: String! {
        get {
            day + "/" + month + "/" + year
        }
    }
    
    var comicNumber: String! {
        get {
            "\(num ?? 0)"
        }
    }
}

