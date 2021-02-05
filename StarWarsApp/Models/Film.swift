//
//  Film.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 05/02/2021.
//

import Foundation

// MARK: - Welcome
struct Film: Codable {
    let title: String
    let openingCrawl: String

    enum CodingKeys: String, CodingKey {
        case title
        case openingCrawl = "opening_crawl"
    }
}
