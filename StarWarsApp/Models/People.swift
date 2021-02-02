//
//  Models.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 02/02/2021.
//

import Foundation

struct People: Codable {
    
    var name: String?
    var birthYear: String?
    var eyeColor: String?
    var gender: String?
    var hairColor: String?
    var height: String?
    var mass: String?
    var skinColor: String?
    var homeworld: String?
    var films: [String]?
    var species: [String]?
    var starships: [String]?
    var vehicles: [String]?
    var url: String?
    var created: String?
    var edited: String?
}
