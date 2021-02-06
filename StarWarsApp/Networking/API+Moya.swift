//
//  API+Moya.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 05/02/2021.
//  Copyright © 2021 Emil Vaklinov. All rights reserved.
//

import Foundation
import Moya

enum APIError: Error {
    case badConnection
    case badResponse
}

enum API {
    case fetchPeople
    case fetchPlanet
    case fetchStarship
    case fetchFilmDetails(id: String)
}

extension API: TargetType {
    
    /// Base URL
    var baseURL: URL {
        guard let url = URL(string: "https://swapi.dev/api") else {
            fatalError("Base URL is invalid")
        }
        return url
    }
    
    /// Paths
    var path: String {
        switch self {
        case .fetchPeople:
            return "/people"
        case .fetchPlanet:
            return "/planets"
        case .fetchStarship:
            return "/starships"
        case .fetchFilmDetails(let id):
            return "/films/\(id)"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String: String]? {
        return nil
    }
}
