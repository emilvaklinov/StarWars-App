//
//  Starship.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 02/02/2021.
//

import Foundation

struct Starship: Codable {
    
    var name: String?
    var model: String?
    var startshipClass: String?
    var manufacturer: String?
    var costInCredits: String?
    var length: String?
    var crew: String?
    var passengers: String?
    var maxAtmospheringSpeed: String?
    var hyperdriveRating: String?
    var MGLT: String?
    var cargoCapacity: String?
    var consumables: String?
    var films: [String]?
    var pilots: [String]?
    var url: String?
    var created: String?
    var edited: String?
}
