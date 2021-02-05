//
//  PeopleVM.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 05/02/2021.
//  Copyright © 2021 Emil Vaklinov. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class PeopleVM {
    
    var peopleModel: People?
    var filmModel = [Film]()
    let provider = MoyaProvider<API>()
    let network = NetworkService()
    
    var peopleResults: [Result]? {
        peopleModel?.results.sorted(by: { $0.name < $1.name })
    }
    
    var people: [String] {
        var people = [String]()
        peopleResults?.forEach {
            people.append($0.name)
        }
        return people
    }
    
    func getFilmIds(for selectedIndex: Int) -> [String] {
        filmModel.removeAll()
        let characterName = people[selectedIndex]
        guard let movies = peopleResults?.first(where: { result -> Bool in
            result.name == characterName
        }) else {
            return []
        }
        
        return movies.films.map({
            ($0.dropLast().components(separatedBy: "/").last ?? "")
        })
    }
}

//MARK: Routing Data Model
struct PeopleDataModel {
    let people: Result?
    let films: [Film]
}

extension PeopleVM {
    
    func dataModel(for index: Int) -> PeopleDataModel {
        return PeopleDataModel(people: peopleResults?[index],
                                  films: filmModel)
    }
}

//MARK: Network Requests
extension PeopleVM {
    func fetchPeople() -> Completable {
        return .create { observer in
            self.network.fetchPeople()
                .subscribe(onSuccess: {
                    self.peopleModel = $0
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
