//
//  ViewFactory.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 05/02/2021.
//  Copyright © 2021 Emil Vaklinov. All rights reserved.
//

import UIKit

class ViewFactory {
    
    private init() { }
    
    
    /// Description
    /// - Parameter model: create data view for People
    /// - Returns: view
    static func createDetailView(for model: PeopleDataModel) -> PeopleDetailVC? {
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        guard
            let view = storyboard
                       .instantiateViewController(withIdentifier: "PeopleDetailVC") as? PeopleDetailVC else { return nil }
        let viewModel = PeopleDetailVM(with: model)
        view.configure(with: viewModel)
        return view
    }
    
    /// Description
    /// - Parameter model: Create data Model for Planets
    /// - Returns: view
    static func createDetailPlanetView(for model: PlanetDataModel) -> PlanetDetailVC? {
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        guard
            let view = storyboard
                       .instantiateViewController(withIdentifier: "PlanetDetailVC") as? PlanetDetailVC else { return nil }
        let viewModel = PlanetDetailVM(with: model)
        view.configure(with: viewModel)
        return view
    }
    
    /// Description
    /// - Parameter model: Create data model for Starships
    /// - Returns: view
    static func createDetailStarshipView(for model: StarshipDataModel) -> StarshipDetailVC? {
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        guard
            let view = storyboard
                       .instantiateViewController(withIdentifier: "StarshipDetailVC") as? StarshipDetailVC else { return nil }
        let viewModel = StarshipDetailVM(with: model)
        view.configure(with: viewModel)
        return view
    }
}
