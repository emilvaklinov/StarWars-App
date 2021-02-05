//
//  Planet.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 02/02/2021.
//

import Foundation

struct Planet: Codable {
    
    let planetResults: [PlanetResult]
}

// MARK: - Result
struct PlanetResult: Codable {
    
    let name, diameter, rotationPeriod, gravity: String?
    let population, climate, terrain, surfaceWater: String?
    let residents: [String]?
    let films: [String]?
    let url, created, edited: String?
    
    enum CodingKeys: String, CodingKey {
        case name, diameter, gravity
        case rotationPeriod = "rotation_period"
        case surfaceWater = "surface_water"
        case population, climate, terrain
        case residents, films
        case url, created, edited
    }
}
