//
//  PlanetVM.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 05/02/2021.
//  Copyright © 2021 Emil Vaklinov. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class PlanetVM {
    
    var planetModel: Planet?
    var filmModel = [Film]()
    let provider = MoyaProvider<API>()
    let network = NetworkService()
    
    var planetResults: [PlanetResult]? {
        planetModel?.planetResults.sorted(by: { $0.name < $1.name })
    }
    
    var planet: [String] {
        var planet = [String]()
        planetResults?.forEach {
            planet.append($0.name)
        }
        return planet
    }
    
    func getFilmIds(for selectedIndex: Int) -> [String] {
        filmModel.removeAll()
        let planetName = planet[selectedIndex]
        guard let movies = planetResults?.first(where: { result -> Bool in
            result.name == planetName
        }) else {
            return []
        }
        
        return movies.films.map({
            ($0.dropLast().components(separatedBy: "/").last ?? "")
        })
    }
}

//MARK: Routing Data Model
struct PlanetDataModel {
    let planet: PlanetResult?
    let films: [Film]
}

extension PlanetVM {
    
    func dataModel(for index: Int) -> PlanetDataModel {
        return PlanetDataModel(planet: planetResults?[index],
                                  films: filmModel)
    }
}

//MARK: Network Requests
extension PlanetVM {
    func fetchPlanet() -> Completable {
        return .create { observer in
            self.network.fetchPlanet()
                .subscribe(onSuccess: {
                    self.planetModel = $0
                    observer(.completed)
                }, onError: { error in
                    observer(.error(error))
                })
        }
    }
    
    func fetchFilms(for selectedId: Int) -> Completable {
        let allCompletables = getFilmIds(for: selectedId)
                              .map { fetchFilm(for: $0) }
        // zip achieves the same thing here what group dispatch would achieve in a non-rx variant
        return Completable.zip(allCompletables)
    }
    
    private func fetchFilm(for filmId: String)  -> Completable {
        return .create { observer in
            self.network.fetchFilm(for: filmId)
                .subscribe(onSuccess: {
                    self.filmModel.append($0)
                    observer(.completed)
                }, onError: { error in
                    observer(.error(error))
                })
        }
    }
}
