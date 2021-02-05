//
//  PeopleDetailVM.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 05/02/2021.
//  Copyright © 2021 Emil Vaklinov. All rights reserved.
//

import Foundation


class PeopleDetailVM {
    
    enum SectionType {
        case attributes, films
    }
    
    enum RowType {
        case name, birthYear, height, mass, hairColor, skinColor, eyeColor, gender, film, crawlCharacter
    }
    
    var model: PeopleDataModel?
    
    init(with model: PeopleDataModel) {
        self.model = model
    }
}
