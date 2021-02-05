//
//  Models.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 02/02/2021.
//

import Foundation

// MARK: - Welcome
struct People: Codable {
    
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let name, height, mass, hairColor: String
    let skinColor, eyeColor, birthYear: String
    let gender: Gender
    let films: [String]

    enum CodingKeys: String, CodingKey {
        case name, height, mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender, films
    }
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
    case nA = "n/a"
}

