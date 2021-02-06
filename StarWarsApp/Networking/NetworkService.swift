//
//  NetworkService.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 05/02/2021.
//  Copyright © 2021 Emil Vaklinov. All rights reserved.
//

import Foundation
import RxSwift
import Moya

/// Fertching protocol
protocol NetworkServiceProtocol {
    func fetchPeople() -> Single<People>
    func fetchPlanet() -> Single<Planet>
    func fetchStarship() -> Single<Starship>
    func fetchFilm(for id: String) -> Single<Film>
}

class NetworkService: NetworkServiceProtocol {
    
    private let provider = MoyaProvider<API>()

    func fetchPeople() -> Single<People> {
        return provider.rx.request(.fetchPeople)
            .filterSuccessfulStatusAndRedirectCodes()
            .map(People.self)
    }
    
    func fetchPlanet() -> Single<Planet> {
        return provider.rx.request(.fetchPlanet)
            .filterSuccessfulStatusAndRedirectCodes()
            .map(Planet.self)
    }
    
    func fetchStarship() -> Single<Starship> {
        return provider.rx.request(.fetchStarship)
            .filterSuccessfulStatusAndRedirectCodes()
            .map(Starship.self)
    }
    
    func fetchFilm(for id: String) -> Single<Film> {
        return provider.rx.request(.fetchFilmDetails(id: id))
        .filterSuccessfulStatusAndRedirectCodes()
        .map(Film.self)
    }
}
