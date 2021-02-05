//
//  Resident.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 05/02/2021.
//  Copyright © 2021 Emil Vaklinov. All rights reserved.
//

import Foundation


// MARK: - Welcome
struct Resident: Codable {
    let name: String
    let gender: String

    enum CodingKeys: String, CodingKey {
        case name
        case gender
    }
}
