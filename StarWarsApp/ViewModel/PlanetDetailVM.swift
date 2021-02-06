//
//  PlanetDetailVM.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 05/02/2021.
//  Copyright © 2021 Emil Vaklinov. All rights reserved.
//

import Foundation

class PlanetDetailVM {
    
    enum SectionType {
        case attributes, films
    }
    
    enum RowType {
        case name, diameter, rotationPeriod, gravity, population, climate, terrain, surfaceWater, film, orbitalPeriod, crawlCharacter
    }
    
    fileprivate var model: PlanetDataModel?
    
    init(with model: PlanetDataModel) {
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
        .name, .climate, .diameter, .orbitalPeriod, .gravity, .population, .rotationPeriod, .surfaceWater, .terrain
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
        return ("Name".localized(), model?.planet?.name)
    case (.attributes, .diameter):
        return ("Diameter".localized(), model?.planet?.diameter)
    case (.attributes, .gravity):
        return ("Gravity".localized(), model?.planet?.gravity)
    case (.attributes, .rotationPeriod):
        return ("Rotation Period".localized(), model?.planet?.rotationPeriod)
    case (.attributes, .surfaceWater):
        return ("Surface Water".localized(), model?.planet?.surfaceWater)
    case (.attributes, .population):
        return ("Population".localized(), model?.planet?.population)
    case (.attributes, .climate):
        return ("Climate".localized(), model?.planet?.climate)
    case (.attributes, .terrain):
        return ("Terrain".localized(), model?.planet?.terrain)
        
//    case (.attributes, .residents):
//        return ("Residents".localized(), model?.planet?.residents)
        
    case (.attributes, .orbitalPeriod):
        return ("Orbital Period".localized(), model?.planet?.orbitalPeriod)
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
