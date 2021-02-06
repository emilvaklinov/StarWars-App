//
//  StarshipVM.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 05/02/2021.
//  Copyright © 2021 Emil Vaklinov. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class StarshipVM {
    
    var starshipModel: Starship?
    var filmModel = [Film]()
    let provider = MoyaProvider<API>()
    let network = NetworkService()
    
    var starshipResults: [StarshipResult]? {
        starshipModel?.results.sorted(by: { $0.name! < $1.name!})
    }
    
    var starship: [String] {
        var starship = [String]()
        starshipResults?.forEach {
            starship.append($0.name!)
    }
        return starship
    }
    
    func getFilmIds(for selectedIndex: Int) -> [String] {
        filmModel.removeAll()
        let starshipName = starship[selectedIndex]
        guard let movies = starshipResults?.first(where: { result -> Bool in
            result.name == starshipName
        }) else {
            return []
        }
        
        return movies.films.map({
            ($0.dropLast().components(separatedBy: "/").last ?? "")
        })
    }
}

//MARK: Routing Data Model
struct StarshipDataModel {
    let starship: StarshipResult?
    let films: [Film]
}

extension StarshipVM {
    
    func dataModel(for index: Int) -> StarshipDataModel {
        return StarshipDataModel(starship: starshipResults?[index],
                                  films: filmModel)
    }
}


//MARK: Network Requests
extension StarshipVM {
    func fetchStarship() -> Completable {
        return .create { observer in
            self.network.fetchStarship()
                .subscribe(onSuccess: {
                    self.starshipModel = $0
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
