//
//  Pilot.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 05/02/2021.
//  Copyright © 2021 Emil Vaklinov. All rights reserved.
//

import Foundation


// MARK: - Welcome
struct Pilot: Codable {
    let name: String
 

    enum CodingKeys: String, CodingKey {
        case name
    }
}
