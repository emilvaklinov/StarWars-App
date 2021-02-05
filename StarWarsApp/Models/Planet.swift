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
struct PlanetResult: Codable {
    
    var name: String?
    var diameter: String?
    var rotationPeriod: String?
    var orbitalPeriod: String?
    var gravity: String?
    var population: String?
    var climate: String?
    var terrain: String?
    var surfaceWater: String?
    var residents: [String]?
    var films: [String]?
    var url: String?
    var created:String?
    var edited: String?
}
