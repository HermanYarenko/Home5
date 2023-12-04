//
//  NewsModel.swift
//  SwiftUIHW5
//
//  Created by Герман Яренко on 4.12.23.
//

import Foundation

struct NewsModel: Decodable {
    var results: [NewsItem]?
}

struct NewsItem: Decodable, Identifiable {
    var id: Int
    var publicationDate: Int
    var title: String
    var bodyText: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case publicationDate = "publication_date"
        case title
        case bodyText = "body_text"
    }
}
