//
//  StarshipViewFactory.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 05/02/2021.
//  Copyright © 2021 Emil Vaklinov. All rights reserved.
//

import UIKit

class StarshipViewFactory {
    
    private init() { }
    
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
