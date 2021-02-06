//
//  Starship.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 02/02/2021.
//

import Foundation

struct Starship: Codable {
    
    let results: [StarshipResult]
}

// MARK: - Result
struct StarshipResult: Codable {
    
    let name, model, startshipClass, manufacturer: String?
    let costInCredits, length, crew, passengers: String?
    let maxAtmospheringSpeed, hyperdriveRating, MGLT, cargoCapacity, consumables: String?
    let films: [String]
    let pilots: [String]
    
    enum CodingKeys: String, CodingKey {
        case name, model, manufacturer
        case length, crew, passengers
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case hyperdriveRating = "hyperdrive_rating"
        case cargoCapacity = "cargo_capacity"
        case startshipClass = "startship_class"
        case costInCredits = "cost_in_credits"
        case MGLT, consumables
        case films, pilots

    }
}
