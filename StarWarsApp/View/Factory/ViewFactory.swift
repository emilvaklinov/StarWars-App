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
    
    static func createDetailView(for model: PeopleDataModel) -> PeopleDetailVC? {
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        guard
            let view = storyboard
                       .instantiateViewController(withIdentifier: "PeopleDetailVC") as? PeopleDetailVC else { return nil }
        let viewModel = PeopleDetailVM(with: model)
        view.configure(with: viewModel)
        return view
    }
}
