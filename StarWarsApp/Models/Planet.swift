//
//  Planet.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 02/02/2021.
//

import Foundation

struct Planet: Codable {
    
    let results: [PlanetResult]
}

// MARK: - Result
struct PlanetResult: Codable {
    
    let name, orbitalPeriod, diameter, rotationPeriod, gravity: String
    let population, climate, terrain, surfaceWater: String
    let residents: [String]
    let films: [String]
    
    enum CodingKeys: String, CodingKey {
        case name, diameter, gravity
        case orbitalPeriod = "orbital_period"
        case rotationPeriod = "rotation_period"
        case surfaceWater = "surface_water"
        case population, climate, terrain
        case residents, films
    }
}
