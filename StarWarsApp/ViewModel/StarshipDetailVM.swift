//
//  StarshipDetailVM.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 05/02/2021.
//  Copyright © 2021 Emil Vaklinov. All rights reserved.
//

import Foundation

class StarshipDetailVM {
    
    enum SectionType {
        case attributes, films
    }
    
    enum RowType {
        case name, model, startshipClass, manufacturer, costInCredits, length, crew, passengers, maxAtmospheringSpeed, hyperdriveRating, MGLT, cargoCapacity, consumables, film, crawlCharacter
    }
    
    fileprivate var model: StarshipDataModel?
    
    init(with model: StarshipDataModel) {
        self.model = model
    }

private lazy var sections: [SectionType] = {
    var sections: [SectionType] = [.attributes]
    model?.films.forEach{ _ in sections.append(.films) }
    return sections
}()

var sectionCount: Int {
    return sections.count
}

func rowCount(for index: Int) -> Int {
    switch sectionType(for: index) {
    case .attributes:
        return attributeRows.count
    case .films:
        return singleFilmRows.count
    }
}

private var attributeRows: [RowType] {
    let rows: [RowType] = [
        .name, .model, .startshipClass, .manufacturer, .costInCredits, .length, .crew, .passengers, .maxAtmospheringSpeed, .hyperdriveRating, .MGLT, .cargoCapacity, .consumables
                          ]
    return rows
}

private var singleFilmRows: [RowType] {
    let rows: [RowType] = [.film, .crawlCharacter]
    return rows
}

private func sectionType(for index: Int) -> SectionType {
    return sections[index]
}

private func rowType(for index: IndexPath) -> RowType {
    switch sectionType(for: index.section) {
    case .attributes:
        return attributeRows[index.row]
    case .films:
        return singleFilmRows[index.row]
    }
}

func rowDetails(for index: IndexPath) -> (description: String, value: String?) {
    
    let section = sectionType(for: index.section)
    let row = rowType(for: index)
    
    switch (section, row) {
    case (.attributes, .name):
        return ("Name".localized(), model?.starship?.name)
    case (.attributes, .model):
        return ("Model".localized(), model?.starship?.model)
    case (.attributes, .manufacturer):
        return ("Manufacturer".localized(), model?.starship?.manufacturer)
    case (.attributes, .length):
        return ("Length".localized(), model?.starship?.length)
    case (.attributes, .crew):
        return ("Crew".localized(), model?.starship?.crew)
    case (.attributes, .passengers):
        return ("Passengers".localized(), model?.starship?.passengers)
    case (.attributes, .maxAtmospheringSpeed):
        return ("Max Atmosphering Speed".localized(), model?.starship?.maxAtmospheringSpeed)
    case (.attributes, .hyperdriveRating):
        return ("Hyperdrive Rating".localized(), model?.starship?.hyperdriveRating)
    case (.attributes, .cargoCapacity):
        return ("Cargo Capacity".localized(), model?.starship?.cargoCapacity)
    case (.attributes, .startshipClass):
        return ("Startship Class".localized(), model?.starship?.startshipClass)
    case (.attributes, .costInCredits):
        return ("Cost In Credits".localized(), model?.starship?.costInCredits)
    case (.attributes, .MGLT):
        return ("MGLT".localized(), model?.starship?.MGLT)
    case (.attributes, .consumables):
        return ("Consumables".localized(), model?.starship?.consumables)
//    case (.attributes, .pilots):
//        return ("Pilots".localized(), model?.starship?.pilots)
    case (.films, .film):
        return ("Film".localized(), film(for: index)?.title)
    case (.films, .crawlCharacter):
        return ("Opening crawl".localized(),
                "\(film(for: index)?.openingCrawl.count ?? 0)")
    default:
        return ("", "")
    }
}

private func film(for index: IndexPath) -> Film? {
    guard let films = model?.films else {
        return nil
    }
    return films[index.section - 1]
}
}
