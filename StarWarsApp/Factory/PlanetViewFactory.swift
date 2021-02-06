//
//  PlanetViewFactory.swift
//  StarWarsApp
//
//  Created by Emil Vaklinov on 05/02/2021.
//  Copyright © 2021 Emil Vaklinov. All rights reserved.
//

import UIKit

class PlanetViewFactory {
    
    private init() { }
    
    static func createDetailPlanetView(for model: PlanetDataModel) -> PlanetDetailVC? {
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        guard
            let view = storyboard
                       .instantiateViewController(withIdentifier: "PlanetDetailVC") as? PlanetDetailVC else { return nil }
        let viewModel = PlanetDetailVM(with: model)
        view.configure(with: viewModel)
        return view
    }
}
